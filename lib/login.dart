import 'package:app/mechanic.dart';
import 'package:app/select.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
String errorMessage = '';
var userRole;
var id;

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          "Welcome",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: SizedBox(),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "LogIn",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),

                SizedBox(
                  height: 0,
                ),

                //email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 2.0, // set the border weight to 2.0
                        color: Color.fromRGBO(47, 114, 100, 1),
                      ),
                      fixedSize: Size(150, 50),
                    ),
                    onPressed: () async {
                      try {
                        String email = emailController.text;
                        String password = passwordController.text;

                        if (email.isEmpty || password.isEmpty) {
                          setState(() {
                            errorMessage = 'Please enter email and password';
                          });
                          return;
                        }

                        // Get the user ID using your authentication method
                        String? uid =
                            await getUidFromEmailAndPassword(email, password);

                        // Check if the user exists in the database
                        QuerySnapshot querySnapshot =
                            await FirebaseFirestore.instance
                                .collection('user')
                                .where('uid', isEqualTo: uid)
                                .limit(1) // Limit the query to 1 document
                                .get();

                        if (uid==null) {
                          setState(() {
                            errorMessage = 'User not found';
                          });
                          return;
                        }

                        querySnapshot.docs.forEach((doc) {
                          // Access the role value and assign it to a string variable
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;
                          String role = data['role'] as String;
                          print('Role: $role');

                          if (role == '1') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => select()),
                            );
                          } else if (role == '2') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => mechanic()),
                            );
                          }
                        });
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          errorMessage = e.message!;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member? .'),
                    Text(
                      "Not a member? .",
                      style: TextStyle(
                        color: Color.fromRGBO(47, 114, 100, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                // show error message if present
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      errorMessage!,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> getUidFromEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("----------------------");
      print(userCredential?.user?.uid?.toString());

      print("----------------------");

      String? uid = userCredential?.user?.uid?.toString();
      // DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('user').doc(uid).get();
      // String role = userSnapshot.get('role');

      String? role;

      print("----------------------");
      print(uid);
      print("----------------------");

      return uid;
    } catch (e) {
      print('Error signing in: $e');
      return null;
    }
  }
}

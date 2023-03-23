import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(400)),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: SizedBox(),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    // child: Image(
                    //   image: AssetImage(
                    //     'assets/12.png',
                    //   ),
                    //   height: 100,
                    // ),
                    child: Text("Login",style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),),
                  ),

                  //email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
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
                          color: Colors.white30,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
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
                          color: Colors.white,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 2.0, // set the border weight to 2.0
                          color: Colors.white,
                        ),
                        fixedSize: Size(150, 50),
                      ),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => home()));
                      },
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member? .',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                      Text(
                        "Not a member? .",
                        style: TextStyle(
                          color: Colors.white30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

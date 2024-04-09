import 'package:app/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class mechanic extends StatefulWidget {
  const mechanic({Key? key}) : super(key: key);

  @override
  State<mechanic> createState() => _mechanicState();
}

class _mechanicState extends State<mechanic> {
  late User _user;

  //get orders

  final databaseReference = FirebaseFirestore.instance;
  List<Map<dynamic, dynamic>> ordersList = [];

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
    String userId = _user.uid;
    databaseReference
        .collection("order")
        .where("Macid", isEqualTo: userId)
        .get()
        .then((QuerySnapshot snapshot) {
      setState(() {
        ordersList = snapshot.docs
            .map((DocumentSnapshot document) =>
                document.data() as Map<dynamic, dynamic>)
            .toList();
      });
    });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => welcome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {
                _signOut();
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('My Account'),
                onTap: () {
                  // Handle navigation to the home screen
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => mechanic()));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Handle navigation to the settings screen
                },
              ),
            ],
          ),
        ),
        body: ordersList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: List.generate(ordersList.length, (index) {
                      Map<dynamic, dynamic> order = ordersList[index];
                      dynamic uid = order['userName'];
                      String uidString = uid.toString();
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 0, left: 10, right: 10),
                              child: Container(
                                height: 180,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Container(
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Text(
                                              "Request Details",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            Text(
                                              "Vehicle Model: ${order["v_type"] ?? ""}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "Fuel Type: ${order["v_fuel"] ?? ""}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "Damage Type: ${order["v_damage"] ?? ""}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "Order Status: ${order["orderStatus"] ?? ""}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                // Get the UID of the user, replace 'uid' with the actual UID retrieval logic

                                                 print(uidString);

                                                // Retrieve the phone number from Firestore
                                                 getPhoneNumber(uid, context);
                                                //
                                                // // Use the phone number as needed
                                                //  print('Phone number: $phoneNumber');

                                                // Call the phone number, or perform any other actions
                                                // Add your emergency notification logic here
                                              },
                                              child: Text(
                                                'Make A Call',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                //primary: Colors.green,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ));
  }

// Define a function to retrieve the phone number based on UID
//   Future<void> displayMobilePopup(BuildContext context, String mobile) async {
//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Mobile Number'),
//           content: Text('The mobile number is: $mobile'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

  Future<void> getPhoneNumber(String uid, BuildContext context) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('user')
          .where('uid', isEqualTo: uid)
          .get();

      querySnapshot.docs.forEach((doc) {
        // Access the role value and assign it to a string variable
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        String mobile = data['mobile'] as String;
        print('Role: $mobile');
        popup(mobile);

        // displayMobilePopup(context, mobile);
      });
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthException
    } catch (e) {
      print(e);
    }
  }




  Future<void> popup(String mobile) async {
    bool _hasCallSupport = false;
    Future<void>? _launched;
    String _phone = '';

    @override
    void initState() {
      super.initState();
      // Check for phone call support.
      canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
        setState(() {
          _hasCallSupport = result;
        });
      });
    }
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mobile Number'),
          content: Text('The mobile number is: $mobile'),
          actions: <Widget>[
            TextButton(
              child: Text('Call'),
              onPressed: () async {

                _makePhoneCall(mobile);


              },

            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }


}

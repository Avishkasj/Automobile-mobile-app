import 'package:app/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                                              onPressed: () {
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
                                                primary: Colors.green,
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
}

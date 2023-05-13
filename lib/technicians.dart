import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class technicians extends StatefulWidget {
  final String dropdownValue;
  final String dropdownValue2;
  final String dropdownValue3;
  final String addressValue;

  const technicians({
    Key? key,
    required this.dropdownValue,
    required this.dropdownValue2,
    required this.dropdownValue3,
    required this.addressValue,
  }) : super(key: key);

  @override
  _techniciansState createState() => _techniciansState();
}

class _techniciansState extends State<technicians> {
  late Future<QuerySnapshot<Map<String, dynamic>>> _userDetailsFuture;

  @override
  void initState() {
    super.initState();
    _userDetailsFuture = fetchUserDetails();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchUserDetails() async {
    return FirebaseFirestore.instance
        .collection('user')
        .where('role', isEqualTo: '2')
        .where('address', isEqualTo: "${widget.addressValue}")
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Technicians (2km)",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on, color: Colors.white),
                    labelText: " ${widget.addressValue}",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: _userDetailsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while fetching data
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final userDetails =
                      snapshot.data?.docs.map((doc) => doc.data()).toList();

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: userDetails?.length,
                    itemBuilder: (context, index) {
                      final user = userDetails![index];
                      return Card(
                        elevation: 4.0,
                        margin: EdgeInsets.all(16.0),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/img${index + 6}.png'),
                                radius: 40.0,
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user['email'] as String,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      user['age'] as String,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.yellow),
                                        SizedBox(width: 8.0),
                                        // Text(
                                        //   user['rating'],
                                        //   style: TextStyle(fontSize: 16.0),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16.0),
                              OutlinedButton(
                                child: Text(
                                  "Contact",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                  width: 2.0, // set the border weight to 2.0
                                  color: Colors.black,
                                )),
                                onPressed: () {
                                  // Contact button pressed
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Text(
                      'No data found.'); // Displayed when there are no user details
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

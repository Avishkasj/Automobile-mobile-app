import 'package:flutter/material.dart';
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
                    labelText:" ${widget.addressValue}",
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

            //card
            Card(
              elevation: 4.0,
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/img6.png'),
                      radius: 40.0,
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Avishka S',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Sri Lanka, Kurunegala',
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
                              Text(
                                '4.5',
                                style: TextStyle(fontSize: 16.0),
                              ),
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
                        )
                      ),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => select()));
                      },
                    ),

                  ],
                ),
              ),
            ),

            //card 2
            Card(
              elevation: 4.0,
              margin: EdgeInsets.fromLTRB(16, 3, 16, 16),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/img7.png'),
                      radius: 40.0,
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kasun J',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Sri Lanka, Kurunegala',
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
                              Text(
                                '4.5',
                                style: TextStyle(fontSize: 16.0),
                              ),
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
                          )
                      ),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => select()));
                      },
                    ),
                  ],
                ),
              ),
            ),




            //card 3
            Card(
              elevation: 4.0,
              margin: EdgeInsets.fromLTRB(16, 3, 16, 16),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/img8.png'),
                      radius: 40.0,
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Janaka N',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Sri Lanka, Kurunegala',
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
                              Text(
                                '4.5',
                                style: TextStyle(fontSize: 16.0),
                              ),
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
                          )
                      ),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => select()));
                      },
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

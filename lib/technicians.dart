import 'package:flutter/material.dart';

class technicians extends StatefulWidget {
  const technicians({Key? key}) : super(key: key);

  @override
  State<technicians> createState() => _techniciansState();
}

class _techniciansState extends State<technicians> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Select",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child:Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on, color: Colors.white),
                    labelText: 'Kurunegala Rd, Bingiriya. Bowatta, Bingiriya.',
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


          ],
        ),
      ),
    );
  }
}

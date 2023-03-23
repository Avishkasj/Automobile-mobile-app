import 'package:flutter/material.dart';

class select extends StatefulWidget {
  const select({Key? key}) : super(key: key);

  @override
  State<select> createState() => _selectState();
}

class _selectState extends State<select> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Select",
        style:TextStyle(
          color: Colors.black,
        ),),
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Column(



        ),
      ) ,
    );
  }
}

import 'package:flutter/material.dart';
class mechanic extends StatefulWidget {
  const mechanic({Key? key}) : super(key: key);

  @override
  State<mechanic> createState() => _mechanicState();
}

class _mechanicState extends State<mechanic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Seller"),
          ],
        ),
      ),
    );
  }
}

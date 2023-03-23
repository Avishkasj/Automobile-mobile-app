import 'package:flutter/material.dart';

const List<String> list = <String>[' Cars/Vans/ Cabs and Jeeps ', 'Three wheelers', 'Motor Bikes', 'Busses/ Lorries'];
const List<String> list2 = <String>[' Cars/Vans/ Cabs and Jeeps ', 'Three wheelers', 'Motor Bikes', 'Busses/ Lorries'];

class select extends StatefulWidget {
  const select({Key? key}) : super(key: key);

  @override
  State<select> createState() => _selectState();
}

class _selectState extends State<select> {
  String dropdownValue = list.first;
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
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Opacity(
                opacity: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/img3.png',
                    width: 600,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            //dropdown vehicale type

            Theme(
              data: ThemeData(
                colorScheme: ColorScheme.light(
                  primary: Colors.white, // set the primary color to white
                  onSurface: Colors.white, // set the onSurface color to white
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.blueAccent),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: "Damage Type",
                    prefixIcon: Icon(
                      Icons.car_crash,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1.0),
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),



            //dropdown damage

            Theme(
              data: ThemeData(
                colorScheme: ColorScheme.light(
                  primary: Colors.white, // set the primary color to white
                  onSurface: Colors.white, // set the onSurface color to white
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.blueAccent),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: "Damage Type",
                    prefixIcon: Icon(
                      Icons.car_crash,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1.0),
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),



            Text(
              'Hello, world!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

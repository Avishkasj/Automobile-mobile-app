import 'package:flutter/material.dart';

const List<String> list = <String>[
  ' Cars/Vans/ Cabs and Jeeps ',
  'Three wheelers',
  'Motor Bikes',
  'Busses/ Lorries'
];
const List<String> list2 = <String>[
  ' Electrical side',
  'Mechanical side',
  'Exhaust system repairing',
  'Tinkering and body painting / Wrapping',
  'Car diagnostic testing /Wheel alignment)',
  'Battery and Hybrid system',
  'Battery replacement',
  'Tire replacement',
  'Cushion works',
  'Air conditioning',
  'Welding ',
  'Washing and cleaning'
];

class select extends StatefulWidget {
  const select({Key? key}) : super(key: key);

  @override
  State<select> createState() => _selectState();
}

class _selectState extends State<select> {
  String dropdownValue = list.first;
  String dropdownValue2 = list2.first;
  int _selectedValue = 1;
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
        child: Container(
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

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Theme(
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
                    value: dropdownValue2,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.blueAccent),
                    onChanged: (String? value2) {
                      setState(() {
                        dropdownValue2 = value2!;
                      });
                    },
                    items: list2.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: "Damage Type",
                      prefixIcon: Icon(
                        Icons.auto_fix_high_outlined,
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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value as int;
                                });
                              },
                              activeColor: Colors.white,
                            ),
                            Text(
                              "Petrol",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value as int;
                                });
                              },
                              activeColor: Colors.white,
                            ),
                            Text(
                              "Diesel",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Radio(
                              value: 3,
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value as int;
                                });
                              },
                              activeColor: Colors.white,
                            ),
                            Text(
                              "Electrical",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         color: Colors.white,
              //         height: 185,
              //         width: 185,
              //         child: Text('test'),
              //       ),
              //     ),
              //
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         color: Colors.white30,
              //         height: 185,
              //         width: 185,
              //         child: Text('test'),
              //       ),
              //     )
              //   ],
              // ),

              SizedBox(height: 240,),
              //next button
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: OutlinedButton(
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 2.0, // set the border weight to 2.0
                          color: Colors.white,
                        ),
                        fixedSize: Size(185, 50),
                      ),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => select()));
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: OutlinedButton(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 2.0, // set the border weight to 2.0
                          color: Colors.white,
                        ),
                        fixedSize: Size(185, 50),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => select()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

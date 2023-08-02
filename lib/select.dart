import 'dart:async';

import 'package:app/technicians.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

import 'MapSample.dart';


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

const List<String> list3 = <String>[
  'Petrol',
  'Diesel',
  'Electric',

];








class select extends StatefulWidget {

  const select({Key? key}) : super(key: key);



  @override
  State<select> createState() => _selectState();
}

TextEditingController address = TextEditingController();
final TextEditingController _locationController = TextEditingController();


class _selectState extends State<select> {


  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  //new added
  static const LatLng _initialCameraPosition = LatLng(6.927079, 79.861244);
  Set<Marker> _markers = Set<Marker>();
  late GoogleMapController _mapController;
  LatLng? _pickedLocation;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    _mapController = controller;
  }

  void _pickLocation(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];
    String address = placemark.locality!+", "+ placemark.country!;

    setState(() {
      _pickedLocation = position;
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId('picked-location'),
        position: _pickedLocation!,
      ));
      _locationController.text = address;
    });

  }
  // late String naddress;
  String dropdownValue = list.first;
  String dropdownValue2 = list2.first;
  String dropdownValue3 = list3.first;
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

              //dropdown vehicle type

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
                        labelText: "Vehicle type",
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

              //fual type

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
                    value: dropdownValue3,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.blueAccent),
                    onChanged: (String? value2) {
                      setState(() {
                        dropdownValue3 = value2!;
                      });
                    },
                    items: list3.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: "Fuak Type",
                      prefixIcon: Icon(
                        Icons.electric_bike,
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(3)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: _locationController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // handle the tap event
                      print('Icon tapped!');
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Container(
                            height:
                            MediaQuery.of(context).size.height * 0.46,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel'),
                                ),
                                Expanded(
                                  child: GoogleMap(
                                    onMapCreated: _onMapCreated,
                                    initialCameraPosition: CameraPosition(
                                      target: _initialCameraPosition,
                                      zoom: 11.0,
                                    ),
                                    markers: _markers,
                                    onTap: _pickLocation,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  hintText: 'Pic Address , ',
                ),
              ),
            ),
          ),
        ),

              // Container(
              //   child: Column(
              //       children: <Widget>[
              //         SizedBox(height: 20),
              //         placesAutoCompleteTextField(),
              //       ],
              //   ),
              // ),



              SizedBox(height: 110,),
              //next button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        fixedSize: Size(140, 50),
                      ),
                      onPressed: () {
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) => MapSample()));
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
                        fixedSize: Size(140, 50),
                      ),
                      onPressed: () {
                        String addressValue = _locationController.text; // the value entered in the address field

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => technicians(
                              dropdownValue: dropdownValue,
                              dropdownValue2: dropdownValue2,
                              dropdownValue3: dropdownValue3,
                              addressValue: addressValue,
                            ),
                          ),
                        );
                      },

                    ),
                  ),

                  //location
                  // Padding(
                  //   padding:
                  //   EdgeInsets.only(top: 20, bottom: 8, left: 25, right: 5),
                  //   child: Text(
                  //     "Select Location ",
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.w800,
                  //     ),
                  //   ),
                  // ),




                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  placesAutoCompleteTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: GooglePlaceAutoCompleteTextField(
            textEditingController: address,
            googleAPIKey: "AIzaSyC_OcQXalmcP3E_f-ZNZp-CZMV6JgPAbWM",
            inputDecoration: InputDecoration(hintText: "Search your location"),
            debounceTime: 800,
            countries: ["lk"],
            isLatLngRequired: true,
            getPlaceDetailWithLatLng: (Prediction prediction) {
              print("placeDetails" + prediction.lng.toString());
            },
            itmClick: (Prediction prediction) {
              address.text = prediction.description!;

              address.selection = TextSelection.fromPosition(
                  TextPosition(offset: prediction.description!.length));
            }
          // default 600 ms ,
        ),
      ),
    );


  }
}

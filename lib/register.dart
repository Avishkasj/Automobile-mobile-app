import 'package:app/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'dart:convert';

import 'network_utiliti.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  //for map

  // Future<void> placeAutocomplete(String query) async {
  //   String apiKey = "AIzaSyCr3P8F9580lfZt5dQA_7N64X3XNaejsRA";
  //   Uri uri = Uri.https(
  //     "maps.googleapis.com",
  //     '/maps/api/place/autocomplete/json',
  //     {
  //       "input": query,
  //       "key": apiKey,
  //     },
  //   );
  //
  //   try {
  //     http.Response response = await http.get(uri);
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> responseBody = json.decode(response.body);
  //       List<dynamic> predictions = responseBody["predictions"];
  //       for (var prediction in predictions) {
  //         String description = prediction["description"];
  //         print(description);
  //       }
  //     } else {
  //       print("Request failed with status: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }

  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController customerMobileController = TextEditingController();
  TextEditingController customerPasswordController = TextEditingController();
  TextEditingController customerEmailController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();

  TextEditingController mechanicNameController = TextEditingController();
  TextEditingController mechanicAgeController = TextEditingController();
  TextEditingController mechanicMobileController = TextEditingController();
  TextEditingController mechanicEmailController = TextEditingController();
  TextEditingController mechanicPasswordController = TextEditingController();
  TextEditingController mechanicLocationController = TextEditingController();

  var uuid = Uuid();
  String sessionToken = '122344';
  List<dynamic> _placeList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mechanicLocationController.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (sessionToken == null) {
      setState(() {
        sessionToken = uuid.v4();
      });
    }

    getSuggstion(mechanicLocationController.text);
  }

  void getSuggstion(String input) async {
    String API_KEY = "AIzaSyC_OcQXalmcP3E_f-ZNZp-CZMV6JgPAbWM";
    String baseURL =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json";
    String request =
        '$baseURL?input=$input&key=$API_KEY&sessiontoken=$sessionToken';

    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();

    if (response.statusCode == 200) {
      setState(() {
        _placeList = jsonDecode(response.body.toString())['discription'];
      });
    } else {
      throw Exception('Faild to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          "Welcome",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SizedBox(),
        ),
      ),
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: [
          _buildRegistrationFormPageOne(),
          _buildRegistrationFormPageTwo(),
        ],
      ),
    );
  }

  Widget _buildRegistrationFormPageOne() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      //Customer
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "Customer",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: customerEmailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'E-mail',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: customerPasswordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: customerMobileController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Mobile No',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: customerAddressController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Permanent Address',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'ID No',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: OutlinedButton(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 2.0, // set the border weight to 2.0
                      color: Colors.black,
                    ),
                    fixedSize: Size(150, 50),
                  ),
                  onPressed: () {
                    _registerCustomer();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Register As mechanic? ",
                    ),
                    GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrationFormPageTwo() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      //Macanic
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "Macanic",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),

              SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: mechanicEmailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'E-mail',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: mechanicPasswordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: mechanicNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: mechanicAgeController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Age',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: mechanicMobileController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Mobile No',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                child: TextFormField(
                  controller: mechanicLocationController,
                  decoration: InputDecoration(
                    hintText: 'Search place',
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                    itemCount: _placeList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_placeList[index]['discription'],style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),),
                      );
                    }),
              ),

              // LocationListTitle(
              //   press:(){},
              //   location: "Banasa, dhaka",
              // ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: OutlinedButton(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 2.0, // set the border weight to 2.0
                      color: Colors.black,
                    ),
                    fixedSize: Size(150, 50),
                  ),
                  onPressed: () {
                    _registerMechanic();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Register As User? ",
                    ),
                    GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _registerCustomer() async {
    String mobile = customerMobileController.text;
    String password = customerPasswordController.text;
    String email = customerEmailController.text;
    String address = customerAddressController.text;

    if (mobile.isNotEmpty &&
        password.isNotEmpty &&
        email.isNotEmpty &&
        address.isNotEmpty) {
      try {
        // Create a new customer document in Firestore
        await FirebaseFirestore.instance.collection('user').add({
          'mobile': mobile,
          'password': password,
          'email': email,
          'address': address,
          'role': "1",
        });

        // Register the user with Firebase Authentication
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, // Use the email as the username
          password: password,
        );

        // Navigate to the select page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => login()),
        );
      } catch (e) {
        // Show an error message if registration fails
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(e.toString()),
              actions: <Widget>[
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
    } else {
      // Show an error message if any field is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill all the fields.'),
            actions: <Widget>[
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
  }

  void _registerMechanic() async {
    String name = mechanicNameController.text;
    String age = mechanicAgeController.text;
    String mobile = mechanicMobileController.text;
    String password = mechanicPasswordController.text;
    String email = mechanicEmailController.text;

    if (name.isNotEmpty && age.isNotEmpty && mobile.isNotEmpty) {
      // Create a new mechanic document in Firestore
      await FirebaseFirestore.instance.collection('user').add({
        'name': name,
        'age': age,
        'mobile': mobile,
        'email': email,
        'role': "2",
      });

      // Register the user with Firebase Authentication
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, // Use the email as the username
        password: password,
      );

      // Navigate to the select page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    } else {
      // Show an error message if any field is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill all the fields.'),
            actions: <Widget>[
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
  }
}

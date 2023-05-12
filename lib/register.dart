import 'package:app/login.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/select.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  TextEditingController customerMobileController = TextEditingController();
  TextEditingController customerPasswordController = TextEditingController();
  TextEditingController customerUsernameController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();

  TextEditingController mechanicNameController = TextEditingController();
  TextEditingController mechanicAgeController = TextEditingController();
  TextEditingController mechanicMobileController = TextEditingController();

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
      backgroundColor: Colors.black,
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
        child: Container(
        child: Column(
        children: [
        Padding(
        padding: const EdgeInsets.only(bottom: 20),
    child: Container(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    GestureDetector(
    onTap: () {
    _pageController.animateToPage(
    0,
    duration: Duration(milliseconds: 500),
    curve: Curves.ease,
    );
    },
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Container(
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(4),
    ),
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Icon(
    Icons.switch_account,
    size: 40,
    ),
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    ),
    GestureDetector(
    onTap: () {
    _pageController.animateToPage(
    1,
    duration: Duration(milliseconds: 500),
    curve: Curves.ease,
    );
    },
    child: Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(4),
    color: Colors.white,
    ),
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Icon(
    Icons.auto_fix_high,
    size: 40,

    ),
    ),
      ],
    ),
    ),
    ),
        ),
        ],
        ),
        ),
    ),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: Container(
    decoration: BoxDecoration(
    color: Colors.white30,
    border: Border.all(color: Colors.white),
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
    border: Border.all(color: Colors.white),
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
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(12)),
    child: Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: TextField(
    controller: customerUsernameController,
    decoration: InputDecoration(
    border: InputBorder.none,
    hintText: 'User Name',
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
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(12)),
    child: Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: TextField(
    controller: customerAddressController,
    decoration: InputDecoration(
    border: InputBorder.none,
    hintText: 'Working place',
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
    border: Border.all(color: Colors.white),
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

    "Already have an account? ",
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
    );
  }

  Widget _buildRegistrationFormPageTwo() {
    return Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Container(
          child: Column(
              children: [
          Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.switch_account,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.auto_fix_high,
                                  size: 40,
                                ),
                              ),
                            ],
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white30,
                border: Border.all(color: Colors.white),
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
                border: Border.all(color: Colors.white),
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
    border:
    Border.all(color: Colors.white),
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: OutlinedButton(
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 2.0, // set the border weight to 2.0
                        color: Colors.white,
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
                        "Already have an account? ",
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
    );
  }

  void _registerCustomer() async {
    String mobile = customerMobileController.text;
    String password = customerPasswordController.text;
    String username = customerUsernameController.text;
    String address = customerAddressController.text;

    if (mobile.isNotEmpty &&
        password.isNotEmpty &&
        username.isNotEmpty &&
        address.isNotEmpty) {
      // Create a new customer document in Firestore
      await FirebaseFirestore.instance.collection('customers').add({
        'mobile': mobile,
        'password': password,
        'username': username,
        'address': address,
      });

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

  void _registerMechanic() async {
    String name = mechanicNameController.text;
    String age = mechanicAgeController.text;
    String mobile = mechanicMobileController.text;

    if (name.isNotEmpty && age.isNotEmpty && mobile.isNotEmpty) {
      // Create a new mechanic document in Firestore
      await FirebaseFirestore.instance.collection('mechanics').add({
        'name': name,
        'age': age,
        'mobile': mobile,
      });

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
    child
        : Text('OK'),
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

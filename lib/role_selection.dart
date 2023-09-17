import 'package:flutter/material.dart';
import 'login.dart';

class RoleSelect extends StatefulWidget {
  final Function(String) onRoleSelected;

  RoleSelect({required this.onRoleSelected});

  @override
  RoleSelectState createState() => RoleSelectState();
}

class RoleSelectState extends State<RoleSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2E2D2D),
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Text(
                  'Select user type',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 225,
                width: 225,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onRoleSelected("Admin");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(
                            selectedRole: 'Admin',
                          ),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 180, 180, 180),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.all(20), // Adjust the padding values
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/Admin.png',
                        width: 80, // Adjust the width of the image as needed
                        height: 80, // Adjust the height of the image as needed
                      ),
                      SizedBox(
                          height: 10), // Add spacing between image and text
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  10), // Adjust the bottom padding as needed
                          child: Text(
                            'Admin',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black), // Adjust the font size
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              SizedBox(
                height: 225,
                width: 225,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onRoleSelected("Farmer");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(
                            selectedRole: 'Farmer',
                          ),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 180, 180, 180),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 80), // Adjust the padding values
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/Farmer.png',
                        width: 80, // Adjust the width of the image as needed
                        height: 80, // Adjust the height of the image as needed
                      ),
                      SizedBox(
                          height: 10), // Add spacing between image and text
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  10), // Adjust the bottom padding as needed
                          child: Text(
                            'Farmer',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black), // Adjust the font size
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]));
  }
}

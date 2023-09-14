import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'login.dart';
import 'home.dart';
import 'qrcodescanner.dart';
import 'infoform.dart';
import 'viewrecord.dart';
import 'role_selection.dart';
import 'qrcodescanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? selectedRole; //Default role for role selection

  void _updateRole(String newRole) {
    setState(() {
      selectedRole = newRole;
    });
  }

  int index = 0; // Track the selected tab index

  // Define the screens that correspond to each tab
  final List<Widget> farmerScreens = [
    HomeScreen(),
    QRCodeScanner(),
    ViewRecord(),
  ];

  final List<Widget> adminScreens = [
    HomeScreen(),
    InfoForm(),
    ViewRecord(),
  ];

  // Define the titles for each navigation item
  final List<String> farmerNavigationTitles = [
    'Home',
    'QR Code Scanner',
    'View Record',
  ];

  final List<String> adminNavigationTitles = [
    'Home',
    'Create QR',
    'View Record',
  ];

  List<IconData> adminIcons = [
    Icons.home,
    Icons.create,
    Icons.description,
  ];

  List<IconData> farmerIcons = [
    Icons.home,
    Icons.qr_code,
    Icons.description,
  ];

  List<String> getNavigationTitles() {
    return selectedRole == "Admin"
        ? adminNavigationTitles
        : farmerNavigationTitles;
  }

  //To handle device permission on obtaining location

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = selectedRole == "Admin" ? adminIcons : farmerIcons;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Color.fromARGB(255, 255, 255, 255),
            ),
      ),
      // ignore: unnecessary_null_comparison
      home: selectedRole == null
          ? RoleSelect(
              onRoleSelected: (role) {
                _updateRole(role); // Update the selected role in main.dart
                setState(() {
                  // Navigate to the appropriate screen based on the selected role
                  if (role == 'Admin') {
                    index = 0; // Navigate to the Admin screen
                  } else if (role == 'Farmer') {
                    index = 1; // Navigate to the Farmer screen
                  }
                });
              },
            )
          : Scaffold(
              appBar: AppBar(
                title: Text(
                  selectedRole!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.46,
                  ),
                ),
                titleTextStyle: TextStyle(color: Colors.black),
                backgroundColor: Colors.yellow,
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    // Implement your sidebar logic here
                  },
                ),
              ),

              body: selectedRole == 'Admin'
                  ? adminScreens[index]
                  : farmerScreens[index], // Show the selected screen
              bottomNavigationBar: NavigationBarTheme(
                data: NavigationBarThemeData(
                  indicatorColor: Colors.blue.shade500,
                  labelTextStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  iconTheme: MaterialStateProperty.all(
                      IconThemeData(color: Colors.white)),
                ),
                child: NavigationBar(
                  backgroundColor:
                      Color(0xFF434343), // Set bottom nav background color
                  selectedIndex: index,
                  onDestinationSelected: (index) =>
                      setState(() => this.index = index),
                  destinations: [
                    for (int i = 0; i < getNavigationTitles().length; i++)
                      NavigationDestination(
                        icon: Icon(icons[i]),
                        label: getNavigationTitles()[i],
                      ),
                  ],
                ),
              ),
            ),
    );
  }
}

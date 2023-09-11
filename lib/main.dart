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
  int index = 0; // Track the selected tab index

  // Define the screens that correspond to each tab
  final List<Widget> farmerscreens = [
    RoleSelect(),
    QRCodeScanner(),
    ViewRecord(),
  ];

  final List<Widget> adminscreens = [
    RoleSelect(),
    InfoForm(),
    ViewRecord(),
  ];

  // Define the titles for each navigation item
  final List<String> farmernavigationTitles = [
    'Home',
    'QR Code Scanner',
    'View Record',
  ];

  final List<String> adminnavigationTitles = [
    'Home',
    'Info Form',
    'View Record',
  ];

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Color.fromARGB(255, 255, 255, 255),
            ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            farmernavigationTitles[index],
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

        body: farmerscreens[index], // Show the selected screen

        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade500,
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            iconTheme:
                MaterialStateProperty.all(IconThemeData(color: Colors.white)),
          ),
          child: NavigationBar(
            backgroundColor:
                Color(0xFF434343), // Set bottom nav background color
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),

            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.qr_code),
                label: 'Scan',
              ),
              NavigationDestination(
                icon: Icon(Icons.description),
                label: 'View Record',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

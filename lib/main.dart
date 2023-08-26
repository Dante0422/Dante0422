import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'qrcodescanner.dart';
import 'infoform.dart';
import 'viewrecord.dart';

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
    HomeScreen(),
    ViewRecord(),
    InfoForm(),
  ];

  // Define the titles for each navigation item
  final List<String> navigationTitles = [
    'Home',
    'View Record',
    'Info Form',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Color.fromARGB(255, 255, 255, 255),
              fontSizeFactor: 0.75,
            ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            navigationTitles[index],
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

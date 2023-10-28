import 'home.dart';
import 'qrcodescanner.dart';
import 'infoform.dart';
import 'viewrecord.dart';
import 'role_selection.dart';
import 'admin_profile.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? selectedRole;

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
      home: selectedRole == null
          ? RoleSelector()
          : MainScreen(selectedRole: selectedRole!),
    );
  }
}

//Manages UI display according to the role logged in / signed in
class RoleSelector extends StatefulWidget {
  @override
  _RoleSelectorState createState() => _RoleSelectorState();
}

class _RoleSelectorState extends State<RoleSelector> {
  String? selectedRole;

  void _updateRole(String newRole) {
    setState(() {
      selectedRole = newRole;
    });
  }

  @override
  Widget build(BuildContext context) {
    return selectedRole == null
        ? RoleSelect(
            onRoleSelected: _updateRole,
          )
        : MainScreen(selectedRole: selectedRole ?? '');
  }

  Future<bool> handleLocationPermission(BuildContext context) async {
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
}

class MainScreen extends StatefulWidget {
  final String selectedRole;

  MainScreen({required this.selectedRole});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(selectedRole: widget.selectedRole),
      drawer: CustomDrawer(selectedRole: widget.selectedRole),
      body: MainContent(selectedRole: widget.selectedRole, currentIndex: index),
      bottomNavigationBar: CustomNavigationBar(
        selectedRole: widget.selectedRole,
        currentIndex: index,
        onIndexChanged: (int newIndex) {
          setState(() {
            index = newIndex;
          });
        },
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? selectedRole;

  CustomAppBar({required this.selectedRole});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      leading: Builder(
        builder: (context) {
          return IconButton(
            color: const Color.fromARGB(255, 48, 48, 48),
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final String selectedRole;

  CustomDrawer({required this.selectedRole});

  // Function to handle logout and navigate to the role selection screen
  void _handleLogout(BuildContext context) {
    selectedRole == '';
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            RoleSelector(), // Navigate back to the role selection screen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Your Name"),
            accountEmail: Text("youremail@example.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            onTap: () {
              // Navigate to the profile screen
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileSetting(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Sign Out',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              //call logout function and update the context for the navigator (popping)
              _handleLogout(context);
            },
          ),
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  final String selectedRole;
  final int currentIndex;

  MainContent({required this.selectedRole, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    // Define screens based on selectedRole
    final List<Widget> screens = selectedRole == 'Admin'
        ? [HomeScreen(), InfoForm(), ViewRecord()]
        : [HomeScreen(), QRCodeScanner(), ViewRecord()];

    return screens[currentIndex];
  }
}

class CustomNavigationBar extends StatelessWidget {
  final String selectedRole;
  final int currentIndex;
  final Function(int) onIndexChanged;

  CustomNavigationBar({
    required this.selectedRole,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Define navigation items based on selectedRole
    final List<String> navigationTitles = selectedRole == 'Admin'
        ? ['Home', 'Create QR', 'View Record']
        : ['Home', 'QR Code Scanner', 'View Record'];

    // Define icons based on selectedRole
    final List<IconData> icons = selectedRole == 'Admin'
        ? [Icons.home, Icons.create, Icons.description]
        : [Icons.home, Icons.qr_code, Icons.description];

    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 67, 67, 67),
      currentIndex: currentIndex,
      unselectedLabelStyle: TextStyle(color: Colors.white),
      selectedLabelStyle:
          TextStyle(color: Color.fromARGB(248, 13, 154, 255)), // Add this line
      onTap: onIndexChanged,
      items: List.generate(
        navigationTitles.length,
        (index) => BottomNavigationBarItem(
          icon: Icon(icons[index], color: Color.fromARGB(255, 255, 255, 255)),
          label: navigationTitles[index],
        ),
      ),
    );
  }
}

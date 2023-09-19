import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class QRCodeScanner extends StatefulWidget {
  @override
  QRCodeScannerState createState() => QRCodeScannerState();
}

class QRCodeScannerState extends State<QRCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  String scannedData = '';
  String geolocationData = '';
  String locationMessage = "";

  @override
  void initState() {
    super.initState();
    fetchGeolocationData();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      // Permission granted, fetch geolocation data
      fetchGeolocationData();
    } else if (status.isDenied) {
      // Permission denied
      setState(() {
        locationMessage = "Location permission denied.";
      });
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied, open app settings
      openAppSettings();
    }
  }

  // Function to fetch the device's location
  void fetchGeolocationData() async {
    final permissionStatus = await Permission.location.status;
    if (permissionStatus.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium,
        );
        setState(() {
          locationMessage =
              "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
        });
      } catch (e) {
        setState(() {
          locationMessage = "Error: $e";
        });
      }
    } else {
      // Location permission not granted, request it
      _requestLocationPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  borderRadius: 30,
                  borderColor: Color.fromARGB(255, 133, 255, 249)),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Text(
                'Scanned Data:\n$scannedData',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          // Geolocation display
          Expanded(
            child: SizedBox(
              child: Text(
                'Geolocation Data:\n$locationMessage',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller?.toggleFlash();
        },
        child: Icon(Icons.flash_on),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedData = scanData.code ?? '';
      });
    });
  }
}

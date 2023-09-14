import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScanner extends StatefulWidget {
  @override
  QRCodeScannerState createState() => QRCodeScannerState();
}

class QRCodeScannerState extends State<QRCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  String scannedData = '';
  String geolocationData = '';

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
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
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          // Geolocation display
          Expanded(
            child: SizedBox(
              child: Text(
                'Geolocation Data:\n$geolocationData',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
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

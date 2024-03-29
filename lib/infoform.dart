import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class InfoForm extends StatefulWidget {
  @override
  _InfoFormState createState() => _InfoFormState();
}

class _InfoFormState extends State<InfoForm> {
  //for update the value during input
  TextEditingController farmNameController = TextEditingController();
  TextEditingController farmDistrictController = TextEditingController();
  TextEditingController treeAgeController = TextEditingController();
  String? selectedFarmState;
  String? selectedFarmCountry;
  String? selectedTreeType;

  TextEditingController controller = TextEditingController();

  String? qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E2D2D),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 3, // Set the elevation of the card
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Enter Farm Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: farmNameController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Farm Name',
                    hintText: 'Required Field',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: farmDistrictController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Farm District',
                    hintText: 'Required Field',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Farm Story',
                    hintText: 'Optional Field',
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  items: [
                    DropdownMenuItem(value: 'JH', child: Text('Johor')),
                    DropdownMenuItem(value: 'KD', child: Text('Kedah')),
                    DropdownMenuItem(value: 'KT', child: Text('Kelantan')),
                    DropdownMenuItem(value: 'PG', child: Text('Penang')),
                    DropdownMenuItem(value: 'PH', child: Text('Pahang')),
                    DropdownMenuItem(value: 'ML', child: Text('Melaka')),
                    DropdownMenuItem(
                        value: 'NS', child: Text('Negeri Sembilan')),
                    DropdownMenuItem(value: 'PK', child: Text('Perak')),
                    DropdownMenuItem(value: 'PL', child: Text('Perlis')),
                    DropdownMenuItem(value: 'SB', child: Text('Sabah')),
                    DropdownMenuItem(value: 'SW', child: Text('Sarawak')),
                    DropdownMenuItem(value: 'SL', child: Text('Selangor')),
                    DropdownMenuItem(value: 'TR', child: Text('Terengganu')),
                    // Dropdown items...
                  ],
                  value: selectedFarmState,
                  decoration: InputDecoration(
                    labelText: 'Farm State',
                    hintText: 'Required Field',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    setState(() {
                      selectedFarmState = value; // Update the selected value
                    });
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  items: [
                    DropdownMenuItem(value: 'MY', child: Text('Malaysia')),
                    DropdownMenuItem(value: 'TH', child: Text('Thailand')),
                    DropdownMenuItem(value: 'ID', child: Text('Indonesia')),
                    DropdownMenuItem(value: 'VN', child: Text('Vietnam')),
                    DropdownMenuItem(value: 'PH', child: Text('Philippines')),
                    // Dropdown items...
                  ],
                  value: selectedFarmCountry,
                  decoration: InputDecoration(
                    labelText: 'Farm Country',
                    hintText: 'Required Field',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    setState(() {
                      selectedFarmCountry = value; // Update the selected value
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: treeAgeController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Tree Age',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  items: [
                    DropdownMenuItem(value: 'MK', child: Text('Musang King')),
                    DropdownMenuItem(value: 'D24', child: Text('D24')),
                    DropdownMenuItem(value: 'XO', child: Text('XO')),
                    DropdownMenuItem(value: 'RP', child: Text('Red Prawn')),
                    DropdownMenuItem(value: 'BT', child: Text('Black Thorn')),
                    DropdownMenuItem(
                        value: 'GP', child: Text('Golden Phoenix')),
                    DropdownMenuItem(
                        value: 'MSW', child: Text('Mao Shan Wang')),
                    DropdownMenuItem(value: 'D101', child: Text('D101')),
                    DropdownMenuItem(value: 'D13', child: Text('D13')),
                    DropdownMenuItem(value: 'HL', child: Text('Hor Lor')),
                  ],
                  value: selectedTreeType,
                  decoration: InputDecoration(
                    labelText: 'Tree Type',
                    hintText: 'Required Field',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    setState(() {
                      selectedTreeType = value; // Update the selected value
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Build the data for the QR code based on the form inputs
                      qrData =
                          'http://i2hub.tarc.edu.my:9100/result.html? Farm Name: ${farmNameController.text}\n'
                          'Farm District: ${farmDistrictController.text}\n'
                          'Farm State: $selectedFarmState\n'
                          'Farm Country: $selectedFarmCountry\n'
                          'Tree Age: ${treeAgeController.text}\n'
                          'Tree Type: $selectedTreeType';

                      controller.text = qrData!; // Set text in the controller
                    });
                  },
                  child: Text('View Durian QR Code'),
                ),
                if (qrData != null)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: QrImageView(
                          data: controller.text,
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                      ),
                      Text('QR Code Data:'),
                      Text(qrData!),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

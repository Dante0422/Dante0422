import 'package:flutter/material.dart';

class ViewRecord extends StatefulWidget {
  @override
  ViewRecordState createState() => ViewRecordState();
}

class ViewRecordState extends State<ViewRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E2D2D),
      body: ListView.builder(
        itemCount: 20, // Replace with the actual number of items
        itemBuilder: (context, index) {
          return Container(
            height: 65,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              title: Text('Item $index'),
              subtitle: Text(
                'Durian ID:  $index\n' 'Scanned Time:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              onTap: () {
                // Handle item tap
              },
            ),
          );
        },
      ),
    );
  }
}

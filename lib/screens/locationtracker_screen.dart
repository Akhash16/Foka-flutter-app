import 'package:flutter/material.dart';

class locationTracker extends StatefulWidget {

  static const String id = 'locationtracker_screen.dart';
  const locationTracker({ Key? key }) : super(key: key);

  @override
  _locationTrackerState createState() => _locationTrackerState();
}

class _locationTrackerState extends State<locationTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text('Google map'),
      ),
    );
  }
}
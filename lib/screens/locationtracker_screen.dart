import 'package:flutter/material.dart';
import 'package:foka_mobile_app/screens/profile_page.dart';
import 'package:foka_mobile_app/screens/settings_screen.dart';
import 'package:foka_mobile_app/screens/splash_screen.dart';

import 'home_screen.dart';

class locationTracker extends StatefulWidget {

  static const String id = 'locationtracker_screen.dart';
  const locationTracker({ Key? key }) : super(key: key);

  @override
  _locationTrackerState createState() => _locationTrackerState();
}

class _locationTrackerState extends State<locationTracker> {
  final screens = [
    HomeScreen.id,
    RealProfilepageWidget.id,
    settingsPage.id,
    SplashScreen.id
  ];
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      // currentIndex: currentValue,
      onTap: (index) {
      // setState(() {
      //   currentValue = index;
      // });
      Navigator.pushNamed(context,screens[index]);
      },
      
      items: [
      BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: 'Profile',
        icon: Icon(Icons.person),
      ),
      BottomNavigationBarItem(
        label: 'Settings',
        icon: Icon(Icons.settings),
      ),
      BottomNavigationBarItem(
        label: 'Log out',
        icon: Icon(Icons.logout),
      ),
      ],
    
    ),
      appBar: AppBar(),
      body: Container(
        child: Text('Google map'),
      ),
    );
  }
}
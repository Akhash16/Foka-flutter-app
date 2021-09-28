import 'package:flutter/material.dart';
import 'package:foka_mobile_app/screens/profile_page.dart';
import 'package:foka_mobile_app/screens/splash_screen.dart';

import 'home_screen.dart';

class settingsPage extends StatefulWidget {
  static const String id = 'settings_screen';
  settingsPage({Key? key}) : super(key: key);

  @override
  _settingPageState createState() => _settingPageState();
}

class _settingPageState extends State<settingsPage> {

  int currentValue = 2;
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
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: currentValue,
      onTap: (index) {
      setState(() {
        currentValue = index;
      });
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
      body: Center(
        child: Container(
          child: Text("Contents of this page are yet to be decided"),
        ),
      ),
    );
  }
}
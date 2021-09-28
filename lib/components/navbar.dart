import 'package:flutter/material.dart';
import 'package:foka_mobile_app/screens/home_screen.dart';
import 'package:foka_mobile_app/screens/profile_page.dart';
import 'package:foka_mobile_app/screens/splash_screen.dart';
import 'package:foka_mobile_app/screens/ths_monitor_screen.dart';


class NavBar extends StatefulWidget {
  const NavBar({ Key? key }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentValue = 0;
  final screens = [
    HomeScreen.id,
    RealProfilepageWidget.id,
    THSMonitor.id,
    // Center(child:Text('settings page')),
    SplashScreen.id
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    
    );
      
    
  }
}

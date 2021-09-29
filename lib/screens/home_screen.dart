import 'package:foka_mobile_app/components/boat_widgets.dart';
import 'package:foka_mobile_app/components/navbar.dart';
import 'package:foka_mobile_app/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foka_mobile_app/screens/devices_screen.dart';
import 'package:foka_mobile_app/screens/profile_page.dart';
import 'package:foka_mobile_app/screens/settings_screen.dart';
import 'package:foka_mobile_app/screens/splash_screen.dart';
import 'package:foka_mobile_app/screens/ths_monitor_screen.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key key}) : super(key: key);
 

  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int currentValue = 0;
  final screens = [
    HomeScreen.id,
    RealProfilepageWidget.id,
    settingsPage.id,
    SplashScreen.id
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
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
      backgroundColor: Color(0xFFFDFFD1),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'My Boats',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '5 owned',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    RoundedButton(
                      title: 'Add Boat',
                      color: Color(0xFF0DBDEB),
                      onPressed: () {},
                    ),
                  ],
                ),
                BoatWidget('Boat 1', 30.0, 30,(){Navigator.pushNamed(context, DevicesPageWidget.id);}),
                BoatWidget('Boat 1', 30.0, 30,(){Navigator.pushNamed(context, DevicesPageWidget.id);}),
                BoatWidget('Boat 1', 30.0, 30,(){Navigator.pushNamed(context, DevicesPageWidget.id);}),
                BoatWidget('Boat 1', 30.0, 30,(){Navigator.pushNamed(context, DevicesPageWidget.id);}),
                BoatWidget('Boat 1', 30.0, 30,(){Navigator.pushNamed(context, DevicesPageWidget.id);}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

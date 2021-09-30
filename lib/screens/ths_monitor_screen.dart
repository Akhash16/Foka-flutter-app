import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:foka_mobile_app/screens/profile_page.dart';
import 'package:foka_mobile_app/screens/settings_screen.dart';
import 'package:foka_mobile_app/screens/splash_screen.dart';

import 'home_screen.dart';

class THSMonitor extends StatefulWidget {
  // const THSMonitor({Key key}) : super(key: key);

  static const String id = 'ths_monitor_screen.dart';

  @override
  _THSMonitorState createState() => _THSMonitorState();
}

class _THSMonitorState extends State<THSMonitor> {
  final screens = [
    HomeScreen.id,
    RealProfilepageWidget.id,
    settingsPage.id,
    SplashScreen.id
  ];
  int currentValue = 0;
  late double temperature = 25.0;
  bool isSwitched = false;
  String textValue = 'Off';
  late int humidity = 20;

  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = !isSwitched;
      textValue = (textValue == 'Off') ? 'On' : 'Off';
    });
  }

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
          Navigator.pushNamed(context, screens[index]);
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
      appBar: AppBar(
        title: Text(
          'THS Monitor',
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Temperature',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  DottedBorder(
                    color: Colors.lightBlueAccent,
                    borderType: BorderType.Circle,
                    strokeWidth: 5,
                    dashPattern: [20, 10],
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            temperature.toString(),
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '°C',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      radius: 100.0,
                      backgroundColor: Color(0xFFFDFFD1),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        humidity.toString() + '%',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Image.asset(
                        'images/humidity.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                      Text(
                        'Humidity',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Switch(
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.redAccent[100],
                        activeColor: Colors.green,
                        activeTrackColor: Colors.greenAccent[400],
                        value: isSwitched,
                        onChanged: toggleSwitch,
                      ),
                      Image.asset(
                        'images/smoke.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                      Text(
                        'Smoke Detection',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        textValue,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

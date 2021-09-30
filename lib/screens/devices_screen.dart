import 'package:flutter/material.dart';
import 'package:foka_mobile_app/components/devicewidget.dart';
import 'package:foka_mobile_app/screens/battery_monitor.dart';
import 'package:foka_mobile_app/screens/fluid_monitor.dart';
import 'package:foka_mobile_app/screens/locationtracker_screen.dart';
import 'package:foka_mobile_app/screens/profile_page.dart';
import 'package:foka_mobile_app/screens/security_monitor.dart';
import 'package:foka_mobile_app/screens/settings_screen.dart';
import 'package:foka_mobile_app/screens/splash_screen.dart';
import 'package:foka_mobile_app/screens/ths_monitor_screen.dart';

import 'home_screen.dart';

class DevicesPageWidget extends StatefulWidget {
  static const String id = 'devices_screen';
  

  @override
  _DevicesPageWidgetState createState() => _DevicesPageWidgetState();
}

class _DevicesPageWidgetState extends State<DevicesPageWidget> {

  final screens = [
    HomeScreen.id,
    RealProfilepageWidget.id,
    settingsPage.id,
    SplashScreen.id
  ];
  
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        leading: Icon(Icons.menu, color: Colors.black87),
        title: Text(
          "My Devices",
          style: TextStyle(
              color: Colors.black, fontFamily: "Poppins", fontSize: 25,fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        actions: [
          Align(
            child: Text(
              '5 devices',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black87,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
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
      key: scaffoldKey,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 20, 5, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(5, 30, 0, 0),
                //   child: Text(
                //     'My Devices',
                //     style: TextStyle(
                //       fontFamily: 'Roboto',
                //       fontSize: 25,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                Devicewidget(deviceName: 'Location Tracker', deviceImg: 'https://cdn.discordapp.com/attachments/867367813047779338/868802440676388924/location2.png', direction: 'left',deviceControl: (){Navigator.pushNamed(context, locationTracker.id);},color: Color(0xFF566E7A),),
                Devicewidget(deviceName: 'THS Monitor', deviceImg: 'https://cdn.discordapp.com/attachments/867367813047779338/868802432572989460/temp-monitor.jpg', direction: 'right',deviceControl: (){Navigator.pushNamed(context, THSMonitor.id);},color: Color(0xFF32AC71),),
                Devicewidget(deviceName: 'Battery Monitor', deviceImg: 'https://cdn.discordapp.com/attachments/867367813047779338/868802432312963102/battery-monitor.jpg', direction: 'left',deviceControl: (){Navigator.pushNamed(context, BatteryMonitor.id);},color: Color(0xFF29303B),),
                Devicewidget(deviceName: 'Fluid Monitor', deviceImg: 'https://cdn.discordapp.com/attachments/867367813047779338/868802434368143370/fluid-monitor.jpg', direction: 'right',deviceControl: (){Navigator.pushNamed(context, FluidMonitor.id);},color: Color(0xFF863A95),),
                Devicewidget(deviceName: 'Security Monitor', deviceImg: 'https://cdn.discordapp.com/attachments/867367813047779338/868802437157355530/security-monitor.jpg', direction: 'left',deviceControl: (){Navigator.pushNamed(context, SecurityMonitor.id);},color: Color(0xFF387AEB),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

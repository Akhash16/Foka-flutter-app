import 'package:flutter/material.dart';
import 'package:foka_mobile_app/components/devicewidget.dart';

class DevicesPageWidget extends StatefulWidget {
  

  @override
  _DevicesPageWidgetState createState() => _DevicesPageWidgetState();
}

class _DevicesPageWidgetState extends State<DevicesPageWidget> {
  int currentValue=0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          color: Color(0xFFF5F7B0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 35, 5, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 30, 0, 0),
                  child: Text(
                    'My Devices',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Devicewidget(deviceName: 'Location Tracker', deviceImg: 'https://cdn.discordapp.com/attachments/867367813047779338/868802440676388924/location2.png', direction: 'left'),
                Devicewidget(deviceName: 'THS Monitor', deviceImg: 'https://cdn.discordapp.com/attachments/867367813047779338/868802432572989460/temp-monitor.jpg', direction: 'right'),
                Devicewidget(deviceName: 'Battery Monitor', deviceImg: 'https://cdn.discordapp.com/attachments/867367813047779338/868802432312963102/battery-monitor.jpg', direction: 'left'),
                Devicewidget(deviceName: 'Fluid Monitor', deviceImg: 'https://cdn.discordapp.com/attachments/867367813047779338/868802434368143370/fluid-monitor.jpg', direction: 'right'),
                Devicewidget(deviceName: 'Security Monitor', deviceImg: 'https://cdn.discordapp.com/attachments/867367813047779338/868802437157355530/security-monitor.jpg', direction: 'left'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

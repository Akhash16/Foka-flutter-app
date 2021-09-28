import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SecurityMonitor extends StatefulWidget {
  // const SecurityMonitor({Key key}) : super(key: key);

  static const String id = 'security_monitor';

  @override
  _SecurityMonitorState createState() => _SecurityMonitorState();
}

class _SecurityMonitorState extends State<SecurityMonitor> {

  bool isSwitched = false;

  void toggleSwitch(bool value){
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6C1),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Intruder Alert',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Switch(
                    inactiveThumbColor: Colors.red,
                    inactiveTrackColor: Colors.redAccent[100],
                    activeColor: Colors.green,
                    activeTrackColor: Colors.greenAccent[400],
                    value: isSwitched,
                    onChanged: toggleSwitch,
                  ),
                ],
              ),
              Text(
                'Last Breach: ' + '2 AM',
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Information displayed \n according to the \n given data',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

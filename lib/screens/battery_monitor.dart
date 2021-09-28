import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class BatteryMonitor extends StatefulWidget {
  // const BatteryMonitor({Key key}) : super(key: key);

  static const String id = 'battery_monitor';

  @override
  _BatteryMonitorState createState() => _BatteryMonitorState();
}

class _BatteryMonitorState extends State<BatteryMonitor> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Color(0xFFF6F6C1),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircularStepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 74,
                    stepSize: 10,
                    selectedColor: Colors.greenAccent,
                    unselectedColor: Colors.grey[200],
                    padding: 0,
                    width: 250,
                    height: 250,
                    selectedStepSize: 15,
                    roundedCap: (_, __) => true,
                  ),
                  Text(
                    '74%',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppions',
                    ),
                  )
                ],
              ),
              Text(
                'Estimate max standby',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                    ),
                  ),
                  Text(
                    'd',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '20',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                    ),
                  ),
                  Text(
                    'h',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '30',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                    ),
                  ),
                  Text(
                    's',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}

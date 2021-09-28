import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class FluidMonitor extends StatefulWidget {
  // const FluidMonitor({Key key}) : super(key: key);

  static const String id = 'fluid_monitor';

  @override
  _FluidMonitorState createState() => _FluidMonitorState();
}

class _FluidMonitorState extends State<FluidMonitor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fluid Monitor',
          style: TextStyle(
            color: Colors.blueGrey,
          ),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      backgroundColor: Color(0xFFFDFFD1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Oil               ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircularStepProgressIndicator(
                    totalSteps: 20,
                    currentStep: 12,
                    stepSize: 20,
                    selectedColor: Colors.red,
                    unselectedColor: Colors.purple[400],
                    padding: 3.14 / 80,
                    width: 150,
                    height: 150,
                    startingAngle: 3.14 * 2 / 3,
                    arcSize: 3.14 * 2 / 3 * 2,
                    gradientColor: LinearGradient(
                      colors: [Colors.red, Colors.yellowAccent, Colors.green],
                    ),
                  ),
                  Text(
                    '100%',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 30.0,
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Fresh Water',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircularStepProgressIndicator(
                    totalSteps: 20,
                    currentStep: 12,
                    stepSize: 20,
                    selectedColor: Colors.red,
                    unselectedColor: Colors.purple[400],
                    padding: 3.14 / 80,
                    width: 150,
                    height: 150,
                    startingAngle: 3.14 * 2 / 3,
                    arcSize: 3.14 * 2 / 3 * 2,
                    gradientColor: LinearGradient(
                      colors: [Colors.red, Colors.yellowAccent, Colors.green],
                    ),
                  ),
                  Text(
                    '100%',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 30.0,
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Waste Water',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircularStepProgressIndicator(
                    totalSteps: 20,
                    currentStep: 12,
                    stepSize: 20,
                    selectedColor: Colors.red,
                    unselectedColor: Colors.purple[400],
                    padding: 3.14 / 80,
                    width: 150,
                    height: 150,
                    startingAngle: 3.14 * 2 / 3,
                    arcSize: 3.14 * 2 / 3 * 2,
                    gradientColor: LinearGradient(
                      colors: [Colors.red, Colors.yellowAccent, Colors.green],
                    ),
                  ),
                  Text(
                    '100%',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 30.0,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

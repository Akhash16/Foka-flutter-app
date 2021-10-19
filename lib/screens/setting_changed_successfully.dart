import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SettingsSavedSuccessfully extends StatefulWidget {
  // const SettingsSavedSuccessfully({Key key}) : super(key: key);

  static const String id = 'settings_changed_successfully';

  @override
  _SettingsSavedSuccessfullyState createState() =>
      _SettingsSavedSuccessfullyState();
}

class _SettingsSavedSuccessfullyState extends State<SettingsSavedSuccessfully> {
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircularStepProgressIndicator(
                    selectedColor: Colors.lightGreen.shade300,
                    totalSteps: 20,
                    currentStep: 20,
                    width: 150,
                    height: 150,
                    roundedCap: (_, isSelected) => isSelected,
                  ),
                  Icon(
                    Icons.check,
                    color: Colors.lightGreen.shade200,
                    size: 50.0,
                  ),
                ],
              ),
              Text(
                'Settings Updated \n Successfully',
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              Icon(
                Icons.check_circle,
                color: Colors.lightGreen.shade200,
                size: 50.0,
              ),
            ],
          ),
        ));
  }
}
// check circle

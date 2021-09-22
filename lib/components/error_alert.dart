import 'package:flutter/material.dart';
import 'package:foka_mobile_app/components/error_alert.dart';
import 'package:foka_mobile_app/screens/splash_screen.dart';

class ErrorAlert extends StatelessWidget {
  final String errorTitle;
  final String errorContent;
  final String route;

  ErrorAlert({required this.errorTitle, required this.errorContent, required this.route});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(errorTitle),
      content: Text(errorContent),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.popUntil(context, ModalRoute.withName(SplashScreen.id)),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.popAndPushNamed(context, route),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foka_mobile_app/screens/login_screen.dart';
import 'package:foka_mobile_app/screens/home_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  // const WelcomeScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   startTimer();
  // }

  // startTimer() async {
  //   return Timer(
  //       Duration(seconds: 5),
  //       route(),
  //   );
  // }
  //
  // route() => Navigator.popAndPushNamed(context, WelcomeScreen.id);

  // startTimer() async {
  //   var duration = new Duration(seconds: 6);
  //   return new Timer(duration, route);
  // }

  // startTimer() async => new Timer(new Duration(seconds: 3), route);
  // route() => Navigator.pushReplacementNamed(context, WelcomeScreen.id);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        // Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('images/foka_logo.jpg'),
        //     ),
        //   ),
        //   height: 200,
        //   width: 200,
        // ),
        Center(
          child: Container(
            color: Colors.yellowAccent,
            child: AnimatedTextKit(
              // pause: const Duration(milliseconds: 2000),
              totalRepeatCount: 2,
              onFinished: () => Navigator.pushReplacementNamed(context, LoginScreen.id),
              animatedTexts: [
                TypewriterAnimatedText(
                  'F O K A',
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



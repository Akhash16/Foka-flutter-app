import 'dart:ffi';
import 'package:foka_mobile_app/components/boat_widgets.dart';
import 'package:foka_mobile_app/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key key}) : super(key: key);

  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                BoatWidget('Boat 1', 30.0, 30),
                BoatWidget('Boat 1', 30.0, 30),
                BoatWidget('Boat 1', 30.0, 30),
                BoatWidget('Boat 1', 30.0, 30),
                BoatWidget('Boat 1', 30.0, 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

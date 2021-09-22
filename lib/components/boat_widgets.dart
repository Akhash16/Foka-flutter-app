import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoatWidget extends StatelessWidget {
  // const BoatWidget({Key key}) : super(key: key);
  BoatWidget(this.title, this.temperature, this.battery);

  final String title;
  final double temperature;
  final int battery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
              color: Color(0xF00DBDEB),
              borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 40.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.thermometerEmpty,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          temperature.toString() + '°C',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.batteryHalf,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          battery.toString() + '%',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child:Image.network(
                    'https://image.made-in-china.com/43f34j00vEBYTaqPRfkl/14m-Luxury-Boat-Stock-Sample-Yacht-Only-350-000USD-with-Ce.jpg',
                    height: 100,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';

class Devicewidget extends StatelessWidget {

  Devicewidget({required this.deviceName,required this.deviceImg,required this.direction});

  final String deviceName;
  final String deviceImg;
  final String direction;

  @override
  Widget build(BuildContext context) {
    return direction == 'left'?Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                  child: Container(
                    width: 350,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFF0090FF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0.55),
                          child: Text(
                            deviceName,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Image.network(
                          deviceImg,
                          width: 130,
                          height: 120,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                ):Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                  child: Container(
                    width: 350,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFF0090FF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.network(
                          deviceImg,
                          width: 130,
                          height: 120,
                          fit: BoxFit.fill,
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.55),
                          child: Text(
                            deviceName,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                );
  }
}


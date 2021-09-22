import 'package:flutter/material.dart';

class BatteryMonitor extends StatefulWidget {
  // const BatteryMonitor({Key key}) : super(key: key);

  static const String id = 'battery_monitor';

  @override
  _BatteryMonitorState createState() => _BatteryMonitorState();
}

class _BatteryMonitorState extends State<BatteryMonitor> {
  @override
  Widget build(BuildContext context) {
    return Container();
    // return Scaffold(
    //   backgroundColor: Color(0xFFF6F6C1),
    //   body: SafeArea(
    //     child: Container(
    //       width: double.infinity,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           DottedBorder(
    //             borderType: BorderType.Circle,
    //             strokeWidth: 5,
    //             dashPattern: [20, 10],
    //             padding: EdgeInsets.all(10),
    //             color: Colors.black,
    //             child: CircleAvatar(
    //               radius: 100.0,
    //               backgroundColor: Color(0xFF25343D),
    //               child: CircleAvatar(
    //                 radius: 80.0,
    //                 backgroundColor: Color(0xFF57911E),
    //                 child: Text(
    //                   '54%',
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: 50.0,
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Text(
    //             'Estimate max standby',
    //             style: TextStyle(
    //               fontSize: 28.0,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           Row(
    //             children: [
    //               Text(
    //                 '1',
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 28.0,
    //                 ),
    //               ),
    //               Text(
    //                 'd',
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.w400,
    //                   fontSize: 18.0,
    //                 ),
    //               ),
    //               Text(
    //                 '20',
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 28.0,
    //                 ),
    //               ),
    //               Text(
    //                 'h',
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.w400,
    //                   fontSize: 18.0,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

  }
}

import 'dart:async';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class THSMonitor extends StatefulWidget {
  // const THSMonitor({Key key}) : super(key: key);

  static const String id = 'ths_monitor_screen.dart';

  @override
  _THSMonitorState createState() => _THSMonitorState();
}

class _THSMonitorState extends State<THSMonitor> {

  var parts;
  double temperature = 20.0;
  int humidity = 80;

  @override
  void initState() {
    print('running init');
    // TODO: implement initState
    super.initState();
    Timer timer = Timer.periodic(Duration(seconds: 1), (Timer t) => change());
    Future<MqttServerClient> connectClient() async {
      print('connect started');
      MqttServerClient client =
      MqttServerClient.withPort('14.99.10.249', 'client-001', 1883);
      client.logging(on: true);
      client.onConnected = onConnected;
      client.onDisconnected = onDisconnected;
      client.onUnsubscribed = onUnsubscribed;
      client.onSubscribed = onSubscribed;
      client.onSubscribeFail = onSubscribeFail;
      client.pongCallback = pong;
      client.keepAlivePeriod = 20;

      print('final con');
      final connMessage = MqttConnectMessage()
          .authenticateAs('', '')
      // ignore: deprecated_member_use
          .withClientIdentifier("client-001")
          .keepAliveFor(6000)
          .startClean()
          .withWillQos(MqttQos.atLeastOnce);
      client.connectionMessage = connMessage;
      print('try');
      try {
        await client.connect();
      } catch (e) {
        print('catch');
        print('Exception: $e');
        client.disconnect();
      }

      print('try done');
      client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        MqttPublishMessage message = c[0].payload as MqttPublishMessage;
        final payload =
        MqttPublishPayload.bytesToStringAsString(message.payload.message);

        print('Received message:$payload from topic: ${c[0].topic}>');

        parts = payload.split(',');
        print("message_received : $parts");
      });

      client.subscribe("REC", MqttQos.atLeastOnce);

      return client;
    }

    void start() async {
      await connectClient();
    }

    start();
  }
  // connection succeeded
  void onConnected() {
    print('Connected');
  }

// unconnected
  void onDisconnected() {
    print('Disconnected');
  }

// subscribe to topic succeeded
  void onSubscribed(String topic) {
    print('Subscribed topic: $topic');
  }

// subscribe to topic failed
  void onSubscribeFail(String topic) {
    print('Failed to subscribe $topic');
  }

// unsubscribe succeeded
  void onUnsubscribed(String? topic) {
    print('Unsubscribed topic: $topic');
  }

// PING response received
  void pong() {
    print('Ping response client callback invoked');
  }

  void change() {
    setState(() {
      temperature = double.parse(parts[0]);
      humidity = int.parse(parts[1]);
    });
  }

  bool isSwitched = false;
  String textValue = 'Off';

  void toggleSwitch(bool value){
    setState(() {
      isSwitched = !isSwitched;
      textValue = (textValue=='Off') ? 'On' : 'Off';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFFD1),
      
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: AppBar (
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0)
          )
          // shape: BeveledRectangleBorder(
          //     borderRadius: BorderRadius.circular(20)
          // ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Temperature',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  DottedBorder(
                    color: Colors.lightBlueAccent,
                    borderType: BorderType.Circle,
                    strokeWidth: 5,
                    dashPattern: [20, 10],
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            temperature.toString(),
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '°C',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      radius: 100.0,
                      backgroundColor: Color(0xFFFDFFD1),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        humidity.toString() + '%',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Image.asset(
                        'images/humidity.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                      Text(
                        'Humidity',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Switch(
                        inactiveThumbColor: Colors.red,
                          inactiveTrackColor: Colors.redAccent[100],
                          activeColor: Colors.green,
                          activeTrackColor: Colors.greenAccent[400],
                          value: isSwitched,
                          onChanged: toggleSwitch,
                      ),
                      Image.asset(
                          'images/smoke.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                      Text(
                        'Smoke Detection',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        textValue,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

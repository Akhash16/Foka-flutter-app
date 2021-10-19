import 'dart:async';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class BatteryMonitor extends StatefulWidget {
  // const BatteryMonitor({Key key}) : super(key: key);

  static const String id = 'battery_monitor';

  @override
  _BatteryMonitorState createState() => _BatteryMonitorState();
}

class _BatteryMonitorState extends State<BatteryMonitor> {

  int BatteryPercentage = 80;

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

        BatteryPercentage = int.parse(payload);
        print("message_received : $BatteryPercentage");
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
    if (BatteryPercentage > 100){
      BatteryPercentage = 100;
    }
    else if(BatteryPercentage < 0){
      BatteryPercentage = 0;
    }
    setState(() {
      BatteryPercentage = BatteryPercentage;
    });
  }



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
                    currentStep: BatteryPercentage,
                    stepSize: 10,
                    selectedColor: Colors.greenAccent,
                    unselectedColor: Colors.grey[400],
                    padding: 0,
                    width: 250,
                    height: 250,
                    selectedStepSize: 15,
                    roundedCap: (_, __) => true,
                  ),
                  Text(
                    '$BatteryPercentage%',
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

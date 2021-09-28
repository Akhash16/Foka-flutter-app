import 'package:flutter/material.dart';
import 'package:foka_mobile_app/components/navbar.dart';
import 'package:foka_mobile_app/screens/battery_monitor.dart';
import 'package:foka_mobile_app/screens/devices_screen.dart';
import 'package:foka_mobile_app/screens/license_agreement.dart';
import 'package:foka_mobile_app/screens/profile_page.dart';
import 'package:foka_mobile_app/screens/settings_screen.dart';
import 'package:foka_mobile_app/screens/ths_monitor_screen.dart';
import 'screens/home_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // home: NavBar(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        settingsPage.id: (context) => settingsPage(),
        RealProfilepageWidget.id: (context) => RealProfilepageWidget(),
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        THSMonitor.id: (context) => THSMonitor(),
        LicenseAgreement.id: (context) => LicenseAgreement(),
        BatteryMonitor.id: (context) => BatteryMonitor(),
      },
    );
  }
}


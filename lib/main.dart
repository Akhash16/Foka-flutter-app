import 'package:flutter/material.dart';
import 'package:foka_mobile_app/screens/license_agreement.dart';
import 'package:foka_mobile_app/screens/ths_monitor_screen.dart';
import 'screens/welcome_screen.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: WelcomeScreen.id,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        THSMonitor.id: (context) => THSMonitor(),
        LicenseAgreement.id: (context) => LicenseAgreement(),
        // PeopleScreen.id: (context) => PeopleScreen(),
        // PersonalChatScreen.id: (context) => PersonalChatScreen(),
      },
    );
  }
}

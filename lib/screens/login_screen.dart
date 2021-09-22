import 'package:flutter/material.dart';
import 'package:foka_mobile_app/screens/registration_screen.dart';
import 'package:foka_mobile_app/screens/splash_screen.dart';
import 'package:foka_mobile_app/screens/home_screen.dart';
import 'package:foka_mobile_app/components/rounded_button.dart';
import 'package:foka_mobile_app/components/error_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  bool passwordVisibility = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email, password;
  late String errorTitle, errorContent;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFFDFFD1),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFE3E963),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.95, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Text(
                        'Sign In',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: AlignmentDirectional(-0.95, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, -0.05),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter your email address',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        textAlign: TextAlign.start,
                        // validator: (val) {
                        //   if (val.isEmpty) {
                        //     return 'Field is required';
                        //   }

                        //   return null;
                        // },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: AlignmentDirectional(-0.95, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        'Enter Your Password',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      controller: textController2,
                      obscureText: !passwordVisibility,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility = !passwordVisibility,
                          ),
                          child: Icon(
                            passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF757575),
                            size: 22,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  RoundedButton(
                    title: 'Log In',
                    color: Colors.lightBlueAccent,
                    onPressed: () async {
                      print(email);
                      print(password);
                      try {
                        final newUser = await _auth.signInWithEmailAndPassword(
                            email: email.trim(), password: password);
                        print(newUser);
                        if (newUser != null) {
                          Navigator.popAndPushNamed(context, HomeScreen.id);
                        }
                      } on FirebaseAuthException catch (e) {
                        print(e.message);
                        switch (e.message) {
                          case "A network error (such as timeout, interrupted connection or unreachable host) has occurred.":
                            errorTitle = 'Check Connection';
                            errorContent =
                                'Please check your internet connection';
                            break;
                          case "The password is invalid or the user does not have a password.":
                            errorTitle = 'Incorrect Password';
                            errorContent = 'Please provide correct password';
                            break;
                          case "There is no user record corresponding to this identifier. The user may have been deleted.":
                            errorTitle = 'User Not Registered';
                            errorContent = 'Register as a new user';
                            break;
                          case "Attempt to invoke virtual method 'java.lang.Class java.lang.Object.getClass()' on a null object reference":
                            errorTitle = 'Invalid Input';
                            errorContent = 'Please provide some input';
                            break;
                          case "Password should be at least 6 characters":
                            errorTitle = 'Password Length Lesser';
                            errorContent =
                            'Enter password with more than 6 characters';
                            break;
                        }
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => ErrorAlert(
                            errorTitle: errorTitle,
                            errorContent: errorContent,
                            route: SplashScreen.id,
                          ),
                        );
                      }
                      },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(
                                context, RegistrationScreen.id);
                          },
                          child: Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            print('Forget Password');
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



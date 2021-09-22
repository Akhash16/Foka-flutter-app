import 'package:flutter/material.dart';
import 'package:foka_mobile_app/components/rounded_button.dart';
import 'package:foka_mobile_app/screens/license_agreement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foka_mobile_app/components/error_alert.dart';
import 'package:foka_mobile_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  late bool passwordVisibility1;
  TextEditingController? textController4;
  late bool passwordVisibility2;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password1, password2;
  late String errorTitle, errorContent;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    passwordVisibility1 = false;
    textController4 = TextEditingController();
    passwordVisibility2 = false;
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
            color: Color(0xFFEEEEEE),
          ),
          child: Container(
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
              padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.95, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Text(
                          'Account Details',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.95, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, -0.05),
                      child: TextFormField(
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 0.3,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 0.3,
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
                    Align(
                      alignment: AlignmentDirectional(-0.95, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                        child: Text(
                          'Emaill',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      controller: textController2,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Enter your email address',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.3,
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
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.95, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, -0.05),
                      child: TextFormField(
                        onChanged: (value) {
                          password1 = value;
                        },
                        controller: textController3,
                        obscureText: !passwordVisibility1,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 0.3,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 0.3,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => passwordVisibility1 = !passwordVisibility1,
                            ),
                            child: Icon(
                              passwordVisibility1
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
                        // validator: (val) {
                        //   if (val.isEmpty) {
                        //     return 'Field is required';
                        //   }

                        //   return null;
                        // },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.95, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                        child: Text(
                          'Re-Enter Password',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, -0.05),
                      child: TextFormField(
                        onChanged: (value) {
                          password2 = value;
                        },
                        controller: textController4,
                        obscureText: !passwordVisibility2,
                        decoration: InputDecoration(
                          hintText: 'Confirm Your Password',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 0.3,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 0.3,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => passwordVisibility2 = !passwordVisibility2,
                            ),
                            child: Icon(
                              passwordVisibility2
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
                        // validator: (val) {
                        //   if (val.isEmpty) {
                        //     return 'Field is required';
                        //   }

                        //   return null;
                        // },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RoundedButton(
                        title: 'Next Step',
                        color: Colors.lightBlueAccent,
                        onPressed: () async {
                          print('Next Step pressed');
                          print(email);
                          print(password1);
                          print(password2);
                          if (email == null || email.trim() == '') {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => ErrorAlert(
                                errorTitle: 'Please Enter Email Id ',
                                errorContent:
                                    'The provide Email Id for registering',
                                route: RegistrationScreen.id,
                              ),
                            );
                          } else if (password1 == password2) {
                            try {
                              final newUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email.trim(), password: password1);
                              print(newUser);
                              if (newUser != null) {
                                Navigator.pushNamed(
                                    context, LicenseAgreement.id);
                              }
                            } on FirebaseAuthException catch (e) {
                              print(e.message);
                              switch (e.message) {
                                case "A network error (such as timeout, interrupted connection or unreachable host) has occurred.":
                                  errorTitle = 'Check Connection';
                                  errorContent =
                                      'Please check your internet connection';
                                  break;
                                case "The email address is already in use by another account.":
                                  errorTitle = 'User Exists';
                                  errorContent = 'Try a different email';
                                  break;
                                case "Password should be at least 6 characters":
                                  errorTitle = 'Password Length Lesser';
                                  errorContent =
                                      'Enter password with more than 6 characters';
                                  break;
                                case "Attempt to invoke virtual method 'java.lang.Class java.lang.Object.getClass()' on a null object reference":
                                  errorTitle = 'Invalid Input';
                                  errorContent = 'Please provide some input';
                                  break;
                              }
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => ErrorAlert(
                                  errorTitle: errorTitle,
                                  errorContent: errorContent,
                                  route: RegistrationScreen.id,
                                ),
                              );
                            }
                          } else {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => ErrorAlert(
                                errorTitle: 'Passwords Not Matching',
                                errorContent:
                                    'The provided passwords are not matching',
                                route: RegistrationScreen.id,
                              ),
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

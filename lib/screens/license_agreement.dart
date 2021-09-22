import 'package:flutter/material.dart';
import 'package:foka_mobile_app/components/rounded_button.dart';
import 'package:foka_mobile_app/screens/login_screen.dart';
import 'package:foka_mobile_app/screens/home_screen.dart';

class LicenseAgreement extends StatefulWidget {

  static const String id = 'license_agreement';

  @override
  _LicenseAgreementState createState() => _LicenseAgreementState();
}

class _LicenseAgreementState extends State<LicenseAgreement> {
  bool checkboxListTileValue1 = false;
  bool checkboxListTileValue2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFFDFFD1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-0.7, -0.05),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 220, 0, 0),
                child: Text(
                  'License Agreement',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
              child: CheckboxListTile(
                value: checkboxListTileValue1,
                onChanged: (newValue) =>
                    setState(() => checkboxListTileValue1 = newValue!),
                title: Text(
                  'I will cherish nature and use\ntechnology for good purposes',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: CheckboxListTile(
                value: checkboxListTileValue2,
                onChanged: (newValue) =>
                    setState(() => checkboxListTileValue2 = newValue!),
                title: Text(
                  'I have read and accept\nlicense agreement',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 90, 0, 20),
              child: RoundedButton(
                title: 'Complete Registration',
                color: Color(0xFF0DBDEB),
                onPressed: () {
                  print('License Agreement Button pressed ...');
                  Navigator.popAndPushNamed(context, LoginScreen.id);
                },
              )
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class RectButton extends StatelessWidget {
  RectButton({required this.title, required this.color, required this.onPressed});

  final String title;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        elevation: 2.0,
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 340.0,
          height: 50.0,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
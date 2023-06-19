import 'package:flutter/material.dart';

class CustomeTextStyle extends StatelessWidget {
  const CustomeTextStyle(
      {super.key,
      required this.text,
      required this.color,
      required this.fontFamily,
      required this.fontSize,
      required this.fontWeight});
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          backgroundColor: color,
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}

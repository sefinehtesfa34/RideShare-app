import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RidesHistory extends StatelessWidget {
  const RidesHistory({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        color: const Color(0xFF000000),
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      ),
    );
  }
}
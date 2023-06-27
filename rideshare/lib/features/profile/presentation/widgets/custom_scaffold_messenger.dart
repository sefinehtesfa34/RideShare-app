import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomScaffoldMessenger extends StatelessWidget {
  const CustomScaffoldMessenger({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaffoldMessenger(
          child: Text(
        'Server Failure!',
        style: TextStyle(
          color: Colors.red,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          fontSize: 30.sp,
        ),
      )),
    );
  }
}
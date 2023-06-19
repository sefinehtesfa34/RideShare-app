import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Resend extends StatelessWidget {
  const Resend({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {},
      child: Text(
        "Resend",
        style: TextStyle(
          color: const Color(0xFF6D61F2),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}

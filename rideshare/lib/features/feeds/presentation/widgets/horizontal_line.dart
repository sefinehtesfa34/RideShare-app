import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.sp),
          color: const Color(0XFFA0A0A0),
        ),
        width: 20.w,
        height: 0.5.h,
      ),
    );
  }
}

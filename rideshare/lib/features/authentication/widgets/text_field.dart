import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/utils/style.dart';

class Textfield extends StatelessWidget {
  String text;
  Textfield({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Color(0xFFEFEFFA)),
        child: Padding(
            padding: EdgeInsets.fromLTRB(2.w, 2.h, 34.w, 2.h),
            child: Text(
              text,
              style: myTextStyle.copyWith(
                fontSize: 15.sp,
                color: Color(0xFF8090BA),
              ),
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/style.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.sp),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Color(0xFF6E80B0),
              width: 0.3.w,
            )),
        child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Center(
                child: Text(
              "Submit",
              style: myTextStyle.copyWith(
                  color: Color(0xFF6D61F2), fontSize: 18.sp),
            ))),
      ),
    );
  }
}

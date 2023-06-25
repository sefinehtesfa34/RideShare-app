import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/style.dart';

class CountryCode extends StatelessWidget {
  const CountryCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 6.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Color(0xFFEFEFFA)),
        child: Padding(
            padding: EdgeInsets.fromLTRB(3.w, 1.5.h, 3.w, 1.5.h),
            child: Text(
              "+251",
              style: myTextStyle.copyWith(
                fontSize: 15.sp,
                color: Color(0xFF8090BA),
              ),
            )));
  }
}
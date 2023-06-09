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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Color(0xFFEFEFFA)),
        child: Padding(
            padding: EdgeInsets.fromLTRB(2.w, 2.h, 2.w, 2.h),
            child: Text(
              "+251",
              style: myTextStyle.copyWith(
                fontSize: 15.sp,
                color: Color(0xFF8090BA),
              ),
            )));
  }
}

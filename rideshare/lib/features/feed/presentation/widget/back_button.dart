import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';

class back extends StatelessWidget {
  const back({this.onTap, super.key});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 5.h,
          width: 12.w,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(4)),
          child: Icon(Icons.arrow_back, color: white)),
    );
  }
}

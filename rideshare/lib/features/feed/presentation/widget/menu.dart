import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';

class Menu extends StatelessWidget {
  const Menu({this.onTap, super.key});
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
          child: Icon(Icons.menu, color: white)),
    );
  }
}

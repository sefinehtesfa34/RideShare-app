import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';

class WhereButton extends StatelessWidget {
  const WhereButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 90.w,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(10)),
      // child:
      child: InkWell(
        onTap: () {},
        child: Center(
            child: Text(
          "Where do you want to go?",
          style: TextStyle(
            fontSize: 6.w,
            color: white,
          ),
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'back_arrow_button.dart';

class SpecialAppbar extends StatelessWidget {
  const SpecialAppbar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackArrowButton(onpressed: () => {}),
        SizedBox(width: 16.sp),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
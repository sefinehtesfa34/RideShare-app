import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';

class BorderOnlyButton extends StatelessWidget {
  const BorderOnlyButton(
      {required this.buttonText,
      required this.color,
      required this.onPressed,
      super.key});
  final String buttonText;
  final Color color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: color),
            ),
            backgroundColor: white,
            foregroundColor: color),
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}

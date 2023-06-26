import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/colors.dart';

class FilledButtons extends StatelessWidget {
  const FilledButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 23.w,
      height: 4.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          backgroundColor: primaryColor,
        ),
        onPressed: () {
          // Add functionality for the button here
          Navigator.pop(context); // Close the modal
        },
        child: Text(
          "OK",
          style: TextStyle(
            color: white,
            fontSize: 14.sp,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/colors.dart';

import 'border_only.dart';

class TwoButtonModal extends StatelessWidget {
  // Function to show the modal
  const TwoButtonModal(
      {required this.title,
      required this.description,
      required this.firstButtonText,
      required this.secondButtonText,
      required this.firstButtonColor,
      required this.secondButtonColor,
      required this.onFirstButtonPressed,
      super.key});
  final String title;
  final String description;
  final String firstButtonText;
  final String secondButtonText;
  final Color firstButtonColor;
  final Color secondButtonColor;
  final Function() onFirstButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.sp,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BorderOnlyButton(
                  buttonText: firstButtonText,
                  color: firstButtonColor,
                  onPressed: () {
                    onFirstButtonPressed(); // Call the callback function
                    Navigator.pop(context); // Close the modal
                  },
                  height: 5.h,
                  width: 26.w,
                ),
                SizedBox(
                  width: 3.w,
                ),
                BorderOnlyButton(
                  buttonText: secondButtonText,
                  color: secondButtonColor,
                  onPressed: () {
                    // Add functionality for the button here
                    Navigator.pop(context); // Close the modal
                  },
                  height: 5.h,
                  width: 26.w,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

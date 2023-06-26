import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/colors.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/border_only_button.dart';

class TwoButtonModal extends StatelessWidget {
  // Function to show the modal
  const TwoButtonModal(
      {required this.title, required this.description, super.key});
  final String title;
  final String description;

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
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BorderOnlyButton(
                    buttonText: "Cancel", color: red, onPressed: () {}),
                SizedBox(
                  width: 3.w,
                ),
                BorderOnlyButton(
                  buttonText: "Back",
                  color: primaryColor,
                  onPressed: () {
                    // Add functionality for the button here
                    Navigator.pop(context); // Close the modal
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

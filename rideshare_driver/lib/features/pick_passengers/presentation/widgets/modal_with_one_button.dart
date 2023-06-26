import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/colors.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/filled_button.dart';

class OneButtonModal extends StatelessWidget {
  // Function to show the modal

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'About wait time',
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'You have to start your journey of Picking people before the  time  goes to zero. If not, the ride is going to be canceled.',
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 16.0),
            FilledButtons(),
          ],
        ),
      ),
    );
  }
}

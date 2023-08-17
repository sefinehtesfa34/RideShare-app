import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';
import 'border_only_button.dart';

/// Displays a bottom modal sheet to indicate that the app is searching for a driver.
/// It includes a loading spinner and a cancel button.
///
/// Parameters:
/// - [context]: The build context.
void showSearchDriverModal(BuildContext context) {
  showModalBottomSheet(
    isDismissible: false, // Prevent dismissing the modal by dragging
    enableDrag: false, // Disable dragging the modal
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    backgroundColor: Colors.transparent,
    context: context,
    builder: (_) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            children: [
              SizedBox(height: 5.h),
              Text(
                'Searching for Driver',
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(height: 5.h),
              SpinKitThreeBounce(
                color: primaryColor,
                size: 5.h,
              ),
              SizedBox(height: 5.h),
              BorderOnlyButton(
                buttonText: "Cancel",
                color: Colors.red,
                onPressed: () {
                  Navigator.of(context).pop(); // Close the modal
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

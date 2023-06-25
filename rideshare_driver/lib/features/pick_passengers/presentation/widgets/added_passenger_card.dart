import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/images.dart';

import '../../../../core/utils/colors.dart';

class AddedPassengersCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(1.w),
        child: Row(
          children: [
            CircleAvatar(
              radius: 7.w,
              child: ClipOval(
                child: Container(
                  width: 14.w,
                  height: 14.h,
                  child: Image.asset(
                    person,
                    fit: BoxFit.cover,
                  ),
                ),
              ), // Example placeholder
            ),
            SizedBox(width: 3.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 1.w),
                  child: Text(
                    'Abebe B.',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Row(
                  children: [Image.asset(currentLocation), Text("5mins away")],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 1.w),
                  child: Row(
                    children: [Image.asset(seats2), Text("1 seat")],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Br 100',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 4.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement call button functionality
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                          color: primaryColor,
                          width: 1), // Set the border color and width
                    ),
                    child: const Text(
                      "Call",
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15.w,
            ),
            InkWell(
              onTap: () {
                // Handle the image pressed event here
              },
              child: Image.asset(delete),
            ),
          ],
          // trailing: Icon(Icons.remove), // Minus icon
        ),
      ),
    );
  }
}

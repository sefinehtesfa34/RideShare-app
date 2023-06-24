import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/add_button.dart';
import '../../../../core/utils/images.dart';

class AllPassengersCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[50],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 2.h),
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
                  children: [
                    Image.asset(currentLocation),
                    Text(
                      "5mins away",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: 'Poppins',
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 1.w),
                  child: Row(
                    children: [
                      Image.asset(seats2),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "Bole(5km away)",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontFamily: 'Poppins',
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15.w,
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(colordSeat),
                      const Text(
                        "1 seat",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Image.asset(money),
                      SizedBox(
                        width: 2.w,
                      ),
                      const Text(
                        "Br 100",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AddButton(),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

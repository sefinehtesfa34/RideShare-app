import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/images.dart';
// import '../../../feeds/presentation/widgets/select_button.dart';

class RideCompletePassenger extends StatelessWidget {
  final double totalCost;
  final double tip;
  final double taxRate = 0.15;

  RideCompletePassenger({
    Key? key,
    required this.totalCost,
    required this.tip,
  }) : super(key: key);

  final textStyle400 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 17.sp,
    color: Colors.grey.shade600,
  );
  final textStyle600 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 19.sp,
    color: Colors.black,
  );
  final textStyle700 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 24.sp,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                rideCompleteImage,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Trip Complete!',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                color: modalTextColor,
                letterSpacing: 0.18,
                height: 1.5,
              ).merge(textStyle600),
            ),
            SizedBox(height: 1.h),
            Text(
              'Birr ${totalCost + (totalCost * taxRate * 100).round() / 100 + tip}',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                letterSpacing: 0.3,
                height: 1.28,
              ).merge(textStyle700),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subtotal',
                      style: textStyle400,
                    ),
                    Text(
                      'Tax (6.5%)',
                      style: textStyle400,
                    ),
                    Text(
                      'Tip',
                      style: textStyle400,
                    ),
                    Text(
                      'Total due:',
                      style: textStyle600,
                    ),
                  ],
                ),
                SizedBox(width: 40.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Br $totalCost',
                      style: textStyle400,
                    ),
                    Text(
                      'Br ${(totalCost * taxRate * 100).round() / 100}',
                      style: textStyle400,
                    ),
                    Text(
                      'Br $tip',
                      style: textStyle400,
                    ),
                    Text(
                      'Br ${totalCost + (totalCost * taxRate * 100).round() / 100 + tip}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 8.h),
            InkWell(
              onTap: () {
                context.go('/passengerHome');
              },
              child: Container(
                height: 6.h,
                width: 90.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Finish",
                  style: TextStyle(
                    fontSize: 18.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: white,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
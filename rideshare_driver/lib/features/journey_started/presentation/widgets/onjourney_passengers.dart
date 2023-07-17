import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/images.dart';
import '../../../pick_passengers/presentation/widgets/border_only_button.dart';
// import 'package:rideshare/features/journey_started/presentation/widgets/border_only.dart';

class OnJourneyPassengersCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(1.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(children: [
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
                SizedBox(width: 1.w),
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
                      children: [Image.asset(map), Text("5mins away")],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: Row(
                        children: [Image.asset(seats2), Text("1 seat")],
                      ),
                    ),
                  ],
                ),
            ],),
            
  
            Text(
              'Br 100',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            // SizedBox(
            //   width: 10.w,
            // ),
            BorderOnlyButton(buttonText: "Drop", color: primaryColor, onPressed: (){})
          ],
          // trailing: Icon(Icons.remove), // Minus icon
        ),
      ),
    );
  }
}

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/journey_started/presentation/widgets/onjourney_passengers.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/all_passengers.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleBottomSheet(
        // bottomSheetColor: Colors.amber,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        minHeight: 0.3,
        maxHeight: 0.5,
        initHeight: 0.5,
        bodyBuilder: (context, index) {
          return SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: EdgeInsets.all(3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5.w, 2.h),
                      child: Row(
                        children: [
                          Text(
                            'Passengers',
                            style: TextStyle(
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(width: 37.w,),
                          Text("Total"),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "Br. 100",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6, // Replace with actual passenger count
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            OnJourneyPassengersCard(),
                            SizedBox(height: 2.h,)
                          ],
                        );
                      },
                    ),
                  ],
                ),
              );
            },
            childCount: 1,
          );
        });
  }
}

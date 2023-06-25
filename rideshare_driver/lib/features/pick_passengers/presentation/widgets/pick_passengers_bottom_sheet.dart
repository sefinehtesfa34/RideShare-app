import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/added_passenger_card.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/all_passengers.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/border_only_button.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/count_down.dart';

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
        maxHeight: 0.9,
        initHeight: 0.8,
        bodyBuilder: (context, index) {
          return SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: EdgeInsets.all(3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 2.h),
                      child: Row(
                        children: [
                          Text(
                            'Your Journey starts in:',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(width: 2.w),
                          CountdownTimer(),
                          SizedBox(width: 37.w),
                          BorderOnlyButton(
                              buttonText: "Cancel",
                              color: Colors.red,
                              onPressed: () {})
                        ],
                      ),
                    ),
                    Text(
                      'Added Passengers',
                      style: TextStyle(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.fromLTRB(0, 0, 5.w, 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                      itemCount: 3, // Replace with actual passenger count
                      itemBuilder: (context, index) {
                        return AddedPassengersCard();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      child: Text(
                        'All Passengers',
                        style: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3, // Replace with actual car count
                      itemBuilder: (context, index) {
                        return AllPassengersCard();
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

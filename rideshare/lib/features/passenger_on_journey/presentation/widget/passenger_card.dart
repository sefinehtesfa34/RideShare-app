import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/passenger_on_journey/presentation/widget/custom_cached_image.dart';
import '../../../../core/utils/colors.dart';
import '../../domain/entities/ride_offer.dart';

class PassengerCard extends StatelessWidget {
  final RideOffer passenger;

  PassengerCard({required this.passenger});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.6.h, horizontal: 4.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomizedCachedImage(
              key: GlobalKey(),
              borderRadius: 70,
              imageURL: passenger.user.imageUrl,
              height: 6.h,
              width: 13.w),
          SizedBox(width: 2.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  passenger.user.fullname,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Poppins"),
                ),
                Row(
                  children: [
                    Icon(Icons.location_searching_outlined,
                        size: 1.5.h, color: primaryColor),
                    SizedBox(width: 1.w),
                    Text(
                      '5 mins away', //! change this
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: greyTextColor,
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  Icon(Icons.location_on, size: 1.5.h, color: green),
                  SizedBox(width: 1.w),
                  Flexible(
                    child: Text(
                      "40 mins away",
                      style: TextStyle(fontSize: 14.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ]),
                SizedBox(height: 0.5.h),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.chair, size: 2.h),
              SizedBox(width: 1.w),
              Text(
                '${passenger.seatsAllocated} seats',
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

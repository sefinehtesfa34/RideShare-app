import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/add_button.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/images.dart';
import '../../domain/entity/ride_offer.dart';
import '../bloc/pick_passengers/pick_passengers_bloc.dart';
import 'custom_cache_image.dart';

class AllPassengersCard extends StatelessWidget {
  final RideOffer rideOffer;

  const AllPassengersCard({super.key, required this.rideOffer});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryAccentColor.withOpacity(0.8),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 7.w,
                  child: ClipOval(
                    child: Container(
                      width: 14.w,
                      height: 14.h,
                      child: CustomizedCachedImage(
                          imageURL: rideOffer.user.imageUrl,
                          width: 20.w,
                          height: 8.h,
                          key: GlobalKey()),
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
                        rideOffer.user.fullname,
                        style: TextStyle(
                          fontSize: 16.sp,
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
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: Row(
                        children: [
                          Icon(Icons.airline_seat_recline_normal_rounded),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "Bole(5km away)",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Poppins',
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.airline_seat_recline_normal_rounded,
                          color: primaryColor),
                      Text(
                        "${rideOffer.seatsAllocated} seats",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      Icon(Icons.money, color: primaryColor),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "${rideOffer.price} Birr",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 1.h),
                  AddButton(onPressed: () {
                      BlocProvider.of<PickPassengersBloc>(context)
                          .add(PickPassenger(rideOffer));
                    

                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

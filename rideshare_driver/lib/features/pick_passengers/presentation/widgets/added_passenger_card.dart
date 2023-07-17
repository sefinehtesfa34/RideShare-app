import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/images.dart';
import 'package:rideshare/features/journey_started/presentation/widgets/border_only.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/injections/injection_container.dart';
import '../../../../core/utils/colors.dart';
import '../../domain/entity/ride_offer.dart';
import '../../domain/usecase/drop_passenger_usecase.dart';
import 'custom_cache_image.dart';

class AddedPassengersCard extends StatelessWidget {
  final RideOffer rideOffer;

  const AddedPassengersCard({super.key, required this.rideOffer});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 1.w, right: 1.w, bottom: 2.h),
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
                          imageURL: rideOffer.user.imageUrl ??
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9CnBcwPzAb1eOKDOtfcvSogTmQ96ddf2D5r4X85k&s",
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
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(currentLocation),
                        Text("16 mins away")
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: Row(
                        children: [
                          Icon(Icons.airline_seat_recline_normal),
                          Text('${rideOffer.seatsAllocated} seats')
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // SizedBox(
            //   width: 15.w,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${rideOffer.price} Birr',
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
                    onPressed: () async {
                      final phoneUrl =
                          Uri.parse('tel:${rideOffer.user.phoneNumber}');
                      if (await canLaunchUrl(phoneUrl)) {
                        await launchUrl(phoneUrl);
                      } else {
                        print('Could not launch $phoneUrl');
                      }
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
            // SizedBox(
            //   width: 15.w,
            // ),
            // BorderOnlyButton(
            //     buttonText: "Drop",
            //     color: primaryColor,
            //     onPressed: () async {
            //       final drop = DropPassengerUseCase(sl());
            //       final response = await drop(rideOffer.rideOfferId);

            //       response.fold((failure) => null, (success) {
            //         if (success == true) {}
            //       });
            //     },
            //     height: 4.h,
            //     width: 18.5.w)
            InkWell(
              onTap: () async {
                // Handle the image pressed event here
                final drop = DropPassengerUseCase(sl());
                final response = await drop(rideOffer.rideOfferId);

                response.fold((failure) => null, (success) {
                  if (success == true) {}
                });
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

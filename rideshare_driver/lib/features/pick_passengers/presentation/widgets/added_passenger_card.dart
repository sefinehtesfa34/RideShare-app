import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/images.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/colors.dart';
import '../../domain/entity/ride_offer.dart';
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
                  radius: 5.w, // Adjust the size of the circular image
                  backgroundImage:
                      AssetImage(person), // Replace with your image path
                ),
                // SizedBox(width: 1.w),
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
                        Text("5 mins away")
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
                        throw 'Could not launch $phoneUrl';
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

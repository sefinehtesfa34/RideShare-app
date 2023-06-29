import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/images.dart';

import '../../../../core/utils/colors.dart';
import '../../domain/entity/ride_offer.dart';
import 'border_only_button.dart';

class TwoButtonModal extends StatelessWidget {
  // Function to show the modal
  const TwoButtonModal(
      {required this.title,
      required this.description,
      super.key,
      required this.sourceLocation,
      required this.destinationLocation,
      required this.passengers});
  final String title;
  final String description;
  final LatLng sourceLocation;
  final LatLng destinationLocation;
  final List<RideOffer> passengers;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BorderOnlyButton(
                    buttonText: "Start",
                    color: primaryColor,
                    onPressed: () {
                      print("=============================================");
                      context.go('/onJourney', extra: {
                        "currentLocation": sourceLocation,
                        "destination": destinationLocation,
                        'passengers': passengers,
                      });
                    }),
                SizedBox(
                  width: 3.w,
                ),
                BorderOnlyButton(
                  buttonText: "Back",
                  color: primaryColor,
                  onPressed: () {
                    // Add functionality for the button here
                    Navigator.pop(context); // Close the modal
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PassengerOnJourney extends StatelessWidget {
  const PassengerOnJourney(
      {super.key,
      required this.sourceLatitude,
      required this.sourceLongitude,
      required this.destinationLatitude,
      required this.destinationLongitude});
  final double sourceLatitude;
  final double sourceLongitude;
  final double destinationLatitude;
  final double destinationLongitude;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ShowPoint(text: "Source Latitude: $sourceLatitude"),
            ShowPoint(text: "Source Longtude: $sourceLongitude"),
            ShowPoint(text: "Destination Latitude: $destinationLatitude"),
            ShowPoint(text: "Destination Latitude: $destinationLongitude"),
          ],
        ),
      ),
    );
  }
}

class ShowPoint extends StatelessWidget {
  const ShowPoint({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.h),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20.sp,
        ),
      ),
    );
  }
}

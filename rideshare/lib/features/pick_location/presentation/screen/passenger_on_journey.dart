import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// Passenger On Journey Widget
///
/// This widget displays the passenger's journey details including source and destination points.
class PassengerOnJourney extends StatelessWidget {
  /// Constructs a PassengerOnJourney widget.
  ///
  /// The [sourceLatitude], [sourceLongitude], [destinationLatitude], and [destinationLongitude]
  /// are required parameters representing the geographic coordinates of the source and destination points.
  const PassengerOnJourney({
    super.key,
    required this.sourceLatitude,
    required this.sourceLongitude,
    required this.destinationLatitude,
    required this.destinationLongitude,
  });

  /// The latitude of the source point.
  final double sourceLatitude;

  /// The longitude of the source point.
  final double sourceLongitude;

  /// The latitude of the destination point.
  final double destinationLatitude;

  /// The longitude of the destination point.
  final double destinationLongitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ShowPoint(text: "Source Latitude: $sourceLatitude"),
            ShowPoint(text: "Source Longitude: $sourceLongitude"),
            ShowPoint(text: "Destination Latitude: $destinationLatitude"),
            ShowPoint(text: "Destination Longitude: $destinationLongitude"),
          ],
        ),
      ),
    );
  }
}

/// Show Point Widget
///
/// This widget displays a single point information.
class ShowPoint extends StatelessWidget {
  /// Constructs a ShowPoint widget.
  ///
  /// The [text] parameter is required, representing the text to be displayed.
  const ShowPoint({
    super.key,
    required this.text,
  });

  /// The text to be displayed.
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

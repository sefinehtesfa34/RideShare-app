import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../pick_location/domain/entities/ride_offer.dart';
import '../widgets/bottom_button.dart';
import '../widgets/google_map_viewer.dart';
import '../widgets/journey_started_custom_sheet.dart';

class JourneyStartedPage extends StatelessWidget {
  final LatLng currentLocation;
  final LatLng destination;
  final List<RideOffer> passengers;
  const JourneyStartedPage({
    Key? key,
    required this.currentLocation,
    required this.destination,
    required this.passengers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            GoogleMapViewer(
              source: currentLocation,
              destination: destination,
              passengers: passengers,
            ),
            CustomBottomSheet(),
          ],
        ),
        bottomNavigationBar: const BottomButton());
  }
}

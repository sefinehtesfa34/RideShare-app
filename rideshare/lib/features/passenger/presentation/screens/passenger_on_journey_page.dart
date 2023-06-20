import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/location/location.dart';
import '../../../../core/utils/colors.dart';
import '../widget/back_button_custom_icon.dart';
import '../widget/custom_bottom_sheet.dart';
import '../widget/passenger_on_journey_map.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import "package:latlong2/latlong.dart" as lat_lng;

class PassengerOnJourneyPage extends StatelessWidget {
  final lat_lng.LatLng userLocation;
  final lat_lng.LatLng driverLocation;
  final lat_lng.LatLng destinationLocation;

  const PassengerOnJourneyPage(
      {super.key, required this.userLocation, required this.driverLocation, required this.destinationLocation,
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        OnJourneyMap(
            userLocation: userLocation,
            driverLocation: driverLocation,
            destinationLocation: destinationLocation
            ),
        Positioned(child: BackButtonCustomIcon(), top: 5.h, left: 3.w),
        FlexibleBottomSheet(
            // bottomSheetColor: white,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            minHeight: 0.3,
            maxHeight: 0.7,
            initHeight: 0.4,
            bodyBuilder: (context, index) {
              return SliverChildBuilderDelegate(
                (context, index) {
                  return CustomBottomSheet(
                    driverLocation: driverLocation,
                    destinationLocation: destinationLocation,
                    carModel: 'Toyota Executive 2000',
                    seatsAvailable: 2,
                    driverImageURL:
                        'https://img.freepik.com/premium-photo/happy-young-male-driver-wheel_136930-4.jpg',
                    driverName: 'Driver Name',
                    driverRating: 4.9,
                    driverReviews: 531,
                    carImageURL:
                        'https://thumbs.dreamstime.com/b/range-rover-black-matte-standing-street-florida-usa-174728616.jpg',
                    carPlateNumber: 'ABC-123',
                  );
                },
                childCount: 1,
              );
            }),
      ]),
    );
  }
}

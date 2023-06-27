import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/images.dart';

import '../../../pick_location/domain/entities/location.dart';
import '../../../pick_location/domain/entities/ride_offer.dart';
import '../../../pick_location/domain/entities/user.dart';
import 'onjourney_passengers_card.dart';

// import 'package:rideshare/features/journey_started/presentation/widgets/onjourney_passengers.dart';
class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({super.key});

  List<RideOffer> addedPassengers = [
    RideOffer(
        user: User(
            fullname: "Abebe Fekede",
            age: 20,
            imageUrl: person2,
            phoneNumber: "0961088592"),
        currentLocation: Location(latitude: 9, longitude: 38),
        destination: Location(latitude: 9.2, longitude: 38),
        seatsAllocated: 2,
        price: 60),
    RideOffer(
        user: User(
            fullname: "Abebe Dekede",
            age: 20,
            imageUrl: person,
            phoneNumber: "0961088592"),
        currentLocation: Location(latitude: 9, longitude: 38),
        destination: Location(latitude: 9.2, longitude: 38),
        seatsAllocated: 2,
        price: 60),
    RideOffer(
        user: User(
            fullname: "kebebe Dekede",
            age: 20,
            imageUrl: person2,
            phoneNumber: "0961088592"),
        currentLocation: Location(latitude: 9, longitude: 38),
        destination: Location(latitude: 9.2, longitude: 38),
        seatsAllocated: 2,
        price: 60),
      RideOffer(
        user: User(
            fullname: "Abebe Dekede",
            age: 20,
            imageUrl: person2,
            phoneNumber: "0961088592"),
        currentLocation: Location(latitude: 9, longitude: 38),
        destination: Location(latitude: 9.2, longitude: 38),
        seatsAllocated: 2,
        price: 60),
  ];

  @override
  Widget build(BuildContext context) {
    return FlexibleBottomSheet(
        // bottomSheetColor: Colors.amber,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        minHeight: 0.3,
        maxHeight: 0.5,
        initHeight: 0.5,
        bodyBuilder: (context, index) {
          return SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: EdgeInsets.all(3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5.w, 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Passengers',
                            style: TextStyle(
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          addedPassengers != []
                              ? Text(
                                  '${addedPassengers.map((offer) => offer.price).fold<double>(0, (previousValue, element) => previousValue + element)} Birr',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: addedPassengers
                          .length, // Replace with actual passenger count
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            OnJourneyPassengersCard(
                              rideOffer: addedPassengers[index],
                            ),
                            SizedBox(
                              height: 2.h,
                            )
                          ],
                        );
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

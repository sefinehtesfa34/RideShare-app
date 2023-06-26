import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/images.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/added_passenger_card.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/all_passengers.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/border_only_button.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/count_down.dart';

import '../../../../core/utils/colors.dart';
import '../../domain/entity/location.dart';
import '../../domain/entity/ride_offer.dart';
import '../../domain/entity/user.dart';
import 'sorting_filter.dart';

import 'modal_with_one_button.dart';

class CustomBottomSheet extends StatelessWidget {
  // Function to show the modal
  OneButtonModal showMyModal(BuildContext context) {
    return const OneButtonModal(
        title: "About wait time",
        description:
            'You have to start your journey of Picking people before the  time  goes to zero. If not, the ride is going to be canceled.');
  }

  CustomBottomSheet({super.key});

  List<RideOffer> addedPassengers = [
    RideOffer(
        user: User(
            fullname: "Abebe Fekede",
            age: 20,
            imageUrl:
                "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80",
            phoneNumber: "0961088592"),
        currentLocation: Location(latitude: 9, longitude: 38),
        destination: Location(latitude: 9.2, longitude: 38),
        seatsAllocated: 2,
        price: 60),
    RideOffer(
        user: User(
            fullname: "Abebe Fekede",
            age: 20,
            imageUrl:
                "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80",
            phoneNumber: "0961088592"),
        currentLocation: Location(latitude: 9, longitude: 38),
        destination: Location(latitude: 9.2, longitude: 38),
        seatsAllocated: 2,
        price: 60),
  ];
  List<RideOffer> allPassengers = [
    RideOffer(
        user: User(
            fullname: "Abebe F.",
            age: 20,
            imageUrl:
                "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80",
            phoneNumber: "0961088592"),
        currentLocation: Location(latitude: 9, longitude: 38),
        destination: Location(latitude: 9.2, longitude: 38),
        seatsAllocated: 6,
        price: 60),
    RideOffer(
        user: User(
            fullname: "Kebede B.",
            age: 20,
            imageUrl:
                "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80",
            phoneNumber: "0961088592"),
        currentLocation: Location(latitude: 9, longitude: 38),
        destination: Location(latitude: 9.2, longitude: 38),
        seatsAllocated: 2,
        price: 70),
  ];

  @override
  Widget build(BuildContext context) {
    return FlexibleBottomSheet(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        minHeight: 0.3,
        maxHeight: 0.9,
        initHeight: 0.8,
        bodyBuilder: (context, index) {
          return SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Your Journey starts in:',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              CountdownTimer(),
                              SizedBox(
                                width: 1.w,
                              ),
                              InkWell(
                                child: Image.asset(question),
                                onTap: () {
                                  var modalWidget = showMyModal(context);
                                  showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                      return modalWidget;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          BorderOnlyButton(
                              buttonText: "Cancel",
                              color: Colors.red,
                              onPressed: () {})
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Added Passengers',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
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
                      ],
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: addedPassengers
                          .length, // Replace with actual passenger count
                      itemBuilder: (context, index) {
                        return AddedPassengersCard(
                          rideOffer: addedPassengers[index],
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Text(
                            'All Passengers',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        SortingSelector()
                      ],
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          allPassengers.length, // Replace with actual car count
                      itemBuilder: (context, index) {
                        return AllPassengersCard(
                            rideOffer: allPassengers[index]);
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

import 'dart:convert';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/pick_passengers/presentation/bloc/pick_passengers/pick_passengers_bloc.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/added_passenger_card.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/all_passengers.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/border_only_button.dart';
import 'package:rideshare/features/pick_passengers/presentation/widgets/count_down.dart';

import '../../../../core/utils/colors.dart';
import '../../domain/entity/location.dart';
import '../../domain/entity/ride_offer.dart';
import '../../domain/entity/ride_request.dart';
import '../../domain/entity/user.dart';
import '../bloc/fetch_passengers/fetch_passengers_bloc.dart';
import '../bloc/sorting_selector/sorting_selector_bloc.dart';
import 'bottom_button.dart';
import 'sorting_filter.dart';

class CustomBottomSheet extends StatelessWidget {
  final RideRequest rideRequest;
  CustomBottomSheet({super.key, required this.rideRequest});
  List<RideOffer> addedOffers = [];

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
                          Text(
                            'Added Passengers',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          // SizedBox(width: 2.w),
                          // CountdownTimer(),
                          // IconButton(
                          //     icon: Icon(Icons.help),
                          //     color: primaryColor,
                          //     onPressed: () {}),
                          SizedBox(width: 10.w),

                          // SizedBox(width: 37.w),
                          BorderOnlyButton(
                              buttonText: "Cancel",
                              color: Colors.red,
                              onPressed: () async {
                                print("pressed");
                                try {
                                  var dio = Dio();
                                  final constToken =
                                      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImN0eSI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ByaW1hcnlzaWQiOiJlOGU1YjkxNi1mYmU3LTQzMzMtYmE5Mi01Mzg2MGExYmQwNDciLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJZYXJlZCBUc2VnYXllKzI1MTk4Mjk4NTY3NiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiWWFyZWRUc2VnYXllKzI1MTk4Mjk4NTY3NiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJZYXJlZFRzZWdheWUrMjUxOTgyOTg1Njc2IiwiRnVsbE5hbWUiOiJZYXJlZCBUc2VnYXllIiwiUGhvbmVOdW1iZXIiOiIrMjUxOTgyOTg1Njc2IiwiUm9sZXMiOiJEcml2ZXIiLCJleHAiOjE2ODgyMDE0NTUsImlzcyI6Ind3dy5leGFtcGxlLmNvbSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.auR2gKaQ0Dad3LiKt7W86lzt4UMMd_zwuHtILZdyyuo";
                                  final base =
                                      "https://rideshare-app.onrender.com/api";
                                  final response = await dio.get(
                                    "$base/RideOffers",
                                    options: Options(headers: {
                                      'Content-Type': 'application/json',
                                      "Authorization": {"Bearer $constToken"}
                                    }),
                                  );
                                  var rideRequestB = response.data['value']
                                      ['paginated'][0]['id'];
                                  print(rideRequestB);

                                  await dio.patch(
                                      "$base/RideOffers/Cancel/${rideRequestB}",
                                      options: Options(headers: {
                                        'Content-Type': 'application/json',
                                        "Authorization": {"Bearer $constToken"}
                                      }));
                                  print("ride offer deleted");

                                  context.go("/passengerHome");
                                } catch (ex) {
                                  context.go("/passengerHome");
                                  print(ex);
                                }
                              })
                        ],
                      ),
                    ),
                    BlocConsumer<PickPassengersBloc, PickPassengersState>(
                        builder: (context, state) {
                          if (state is PickPassengersInitial) {
                            return Column(
                              children: [
                                Text("No Passengers Added!",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    )),
                                SizedBox(height: 2.h),
                                Center(
                                    child: SvgPicture.asset(
                                        "assets/images/no_added_passengers.svg",
                                        width: 5.w,
                                        height: 10.h)),
                              ],
                            );
                          } else {
                            if (state is PickPassengersSuccess &&
                                !addedOffers.contains(state.addedOffer)) {
                              addedOffers.add(state.addedOffer);
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Added Passengers',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                        addedOffers != []
                                            ? Text(
                                                '${addedOffers.map((offer) => offer.price).fold<double>(0, (previousValue, element) => previousValue + element)} Birr',
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Poppins',
                                                ),
                                              )
                                            : Padding(
                                                padding: EdgeInsets.all(4.h),
                                                child: Text(
                                                  "You haven't added passengers use the add button to add passengers to your ride",
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ],
                                ),
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: addedOffers.length,
                                  itemBuilder: (context, index) {
                                    return AddedPassengersCard(
                                      rideOffer: addedOffers[index],
                                    );
                                  },
                                ),
                                (state is PickPassengersLoading)
                                    ? Padding(
                                        padding: EdgeInsets.all(3.h),
                                        child: SpinKitThreeBounce(
                                          color: primaryColor,
                                          size: 5.h,
                                        ),
                                      )
                                    : SizedBox()
                              ],
                            );
                          }
                        },
                        listener: (context, state) {}),
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
                        //? this is the popup options for filter
                        // SortingSelector()
                      ],
                    ),
                    BlocConsumer<FetchPassengersBloc, FetchPassengersState>(
                        builder: (_, FetchPassengersState state) {
                      if (state is FetchPassengersLoading ||
                          state is FetchPassengersInitial) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(3.h),
                            child: SpinKitThreeBounce(
                              color: primaryColor,
                              size: 5.h,
                            ),
                          ),
                        );
                      } else if (state is FetchPassengersSuccess) {
                        return StreamBuilder<List<RideOffer>>(
                          stream: state.rideOffers,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: Padding(
                                  padding: EdgeInsets.all(3.h),
                                  child: SpinKitThreeBounce(
                                    color: primaryColor,
                                    size: 5.h,
                                  ),
                                ),
                              );
                            } else if (snapshot.data!.isEmpty) {
                              return Center(
                                child: Text("No ride offers available."),
                              );
                            } else {
                              return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return AllPassengersCard(
                                      rideOffer: snapshot.data![index]);
                                },
                              );
                            }
                          },
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: Center(
                            child: BorderOnlyButton(
                                color: primaryColor,
                                buttonText: "Reload",
                                onPressed: () {
                                  // context.read()
                                  final state =
                                      BlocProvider.of<SortingSelectorBloc>(
                                              context)
                                          .state;
                                  if (state is SortingSelectorInitial) {
                                    BlocProvider.of<FetchPassengersBloc>(
                                            context)
                                        .add(
                                      FetchAllPassengers(request: rideRequest),
                                    );
                                  }
                                }),
                          ),
                        );
                      }
                    }, listener: (_, state) {
                      // if (state is FetchPassengersInitial) {
                      // }
                    }),
                  ],
                ),
              );
            },
            childCount: 1,
          );
        });
  }
}

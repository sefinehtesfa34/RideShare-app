import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapbox_api/mapbox_api.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/passenger_on_journey/presentation/widget/border_only_button.dart';
import 'package:rideshare/features/passenger_on_journey/presentation/widget/passenger_card.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/colors.dart';
import '../../domain/entities/location.dart';
import '../../domain/entities/ride_offer.dart';
import '../../domain/entities/user.dart';
import 'custom_cached_image.dart';
import "package:latlong2/latlong.dart" as lat_lng;

class CustomBottomSheet extends StatefulWidget {
  final String driverPhoneNumber;
  final RideOffer passenger;
  final List<RideOffer> passengersList;
  final String carModel;
  final int seatsAvailable;
  final String driverImageURL;
  final String driverName;
  final double driverRating;
  final String carImageURL;
  final String carPlateNumber;
  final lat_lng.LatLng destinationLocation;
  final lat_lng.LatLng driverLocation;
  lat_lng.LatLng userLocation = lat_lng.LatLng(9, 38);

  CustomBottomSheet({
    required this.driverPhoneNumber,
    required this.passenger,
    required this.passengersList,
    required this.carModel,
    required this.seatsAvailable,
    required this.driverImageURL,
    required this.driverName,
    required this.driverRating,
    required this.carImageURL,
    required this.carPlateNumber,
    Key? key,
    required this.driverLocation,
    required this.destinationLocation,
  }) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  void initState() {
    super.initState();
    setUserLocation();
  }

  final TextStyle grayPoppinsStyle =
      const TextStyle(color: greyTextColor, fontFamily: "Poppins");
  String minutesLeft = "estimatting";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        // Column of components section

        // First component: Text showing minutes left to destination
        Padding(
          padding: EdgeInsets.fromLTRB(2.w, 3.h, 2.w, 1.h),
          child: Text(
            '$minutesLeft mins left to your destination',
            style: TextStyle(
              color: greyTextColor,
              fontFamily: 'Poppins',
            ),
          ),
        ),

        // Second component: Row showing car model and seats availability
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.carModel,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              Text(
                '${widget.seatsAvailable} seats available',
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Poppins"),
              ),
            ],
          ),
        ),

        // Third component: Row showing driver image, name, rating, and reviews
        Padding(
            padding: EdgeInsets.all(4.w),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Driver image on the left
                  CustomizedCachedImage(
                      imageURL: widget.driverImageURL,
                      width: 20.w,
                      height: 8.h,
                      key: GlobalKey()),
                  SizedBox(width: 3.w),

                  // Driver name, rating, and reviews on the right
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.driverName,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"),
                      ),
                      SizedBox(height: 4.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.star,
                              color: rateStarColor, size: 17),
                          SizedBox(width: 0.5.w),
                          Text(
                            style: TextStyle(fontSize: 14.sp),
                            '${widget.driverRating}',
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 4.w),
                  CustomizedCachedImage(
                      imageURL: widget.carImageURL,
                      height: 8.h,
                      width: 30.w,
                      key: GlobalKey()),
                  // Fourth component: Row containing two buttons
                ])),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              children: [
                BorderOnlyButton(
                    color: primaryColor,
                    buttonText: "Call",
                    onPressed: () async {
                      final phoneUrl =
                          Uri.parse('tel:${widget.driverPhoneNumber}');
                      if (await canLaunchUrl(phoneUrl)) {
                        await launchUrl(phoneUrl);
                      } else {
                        print('Could not launch $phoneUrl');
                      }
                    }),
                SizedBox(width: 4.w),
                BorderOnlyButton(
                    color: red,
                    buttonText: "Cancel",
                    onPressed: () {
                      context.go("/passengerHome");
                    }),
                SizedBox(width: 12.w),
                TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: primaryAccentColor),
                    onPressed: null,
                    child: Text(widget.carPlateNumber, style: grayPoppinsStyle))
              ],
            )),
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Passengers",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins"))),
            ),
            Padding(
              padding: EdgeInsets.only(right: 2.w),
              child: Text("You will pay: ${widget.passenger.price} Birr",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins")),
            )
          ],
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.passengersList.length,
            itemBuilder: (context, index) {
              return PassengerCard(passenger: widget.passengersList[index]);
            }),
      ]),
    );
  }

  setUserLocation() async {
    try {
      if (await Geolocator.isLocationServiceEnabled()) {
        var _positionStream = Geolocator.getPositionStream(
                locationSettings: LocationSettings(
                    accuracy: LocationAccuracy.high, distanceFilter: 10))
            .asBroadcastStream();
        _positionStream.listen((Position position) {
          setState(() {
            print(
                "user location change latlng ${position.latitude}, ${position.longitude}");
            widget.userLocation = LatLng(position.latitude, position.longitude);
            getEstimatedTime(widget.userLocation, widget.destinationLocation);
          });
        });
      }
    } catch (e) {}
  }

  getEstimatedTime(lat_lng.LatLng source, lat_lng.LatLng destination) async {
    MapboxApi mapbox = MapboxApi(
      accessToken: dotenv.env['MAP_BOX_Api_ACCESS_TOKEN'],
    );
    final response = await mapbox.directions.request(
      profile: NavigationProfile.DRIVING_TRAFFIC,
      overview: NavigationOverview.FULL,
      geometries: NavigationGeometries.GEOJSON,
      steps: true,
      coordinates: <List<double>>[
        <double>[
          source.latitude, // latitude
          source.longitude, // longitude
        ],
        <double>[
          destination.latitude, // latitude
          destination.longitude, // longitude
        ],
      ],
    );

    try {
      final routes = response.routes;
      final shortestRoute = routes?.first;
      final durationSeconds =
          shortestRoute!.duration!.toInt(); // Total time in seconds
      final durationMinutes =
          (durationSeconds / 60).round(); // Total time in minutes
      setState(() {
        minutesLeft = durationMinutes.toString(); // Total
      });
    } catch (ex) {
      // Handle error
      print(response.error.toString());
      setState(() {
        minutesLeft = 'Unknown';
      });
    }
  }
}

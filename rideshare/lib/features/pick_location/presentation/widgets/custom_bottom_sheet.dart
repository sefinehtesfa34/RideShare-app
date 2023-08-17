import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/colors.dart';
import 'choose_location.dart';
import 'destination_list.dart';
import 'where_button.dart';

// Retrieve the Google Maps API key from the environment variables
final mapApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'];

/// CustomBottomSheet Widget
///
/// A bottom sheet widget that provides options for choosing a destination.
class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleBottomSheet(
      // bottomSheetColor: Colors.amber,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      minHeight: 0.3,
      maxHeight: 0.45,
      initHeight: 0.4,
      bodyBuilder: (context, index) {
        return SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: CustomButton(
                    text: "Where do you want to go?",
                    onTap: () {
                      final GoogleMapsPlaces _places =
                          GoogleMapsPlaces(apiKey: mapApiKey);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => ChooseLocation(
                                places: _places,
                              )),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 6.w, top: 2.h, bottom: 1.5.h),
                    child: Text(
                      "Popular Destinations",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                DestinationList(),
              ],
            );
          },
          childCount: 1,
        );
      },
    );
  }
}

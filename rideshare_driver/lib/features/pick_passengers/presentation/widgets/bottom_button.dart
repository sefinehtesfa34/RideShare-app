import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/colors.dart';
import 'modal_with_two_button.dart';

class BottomButton extends StatelessWidget {
  final LatLng sourceLocation;
  final LatLng destinationLocation;

  TwoButtonModal showMyModal(BuildContext context) {
    return TwoButtonModal(
      sourceLocation: sourceLocation,
      destinationLocation: destinationLocation,
      title: "Start Journey",
      description:
          "By starting your journey you should start collecting each riders. Are you sure you want to start your journey.",
      passengers: [],
    );
  }

  const BottomButton(
      {super.key,
      required this.sourceLocation,
      required this.destinationLocation});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: double.infinity,
      // margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          var modalWidget = showMyModal(context);
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return modalWidget;
            },
          );
        },
        style: ElevatedButton.styleFrom(
          shape: BeveledRectangleBorder(),
          backgroundColor: Colors.green,
        ),
        child:
            const Text('Start', style: TextStyle(fontSize: 18, color: white)),
      ),
    );
  }
}

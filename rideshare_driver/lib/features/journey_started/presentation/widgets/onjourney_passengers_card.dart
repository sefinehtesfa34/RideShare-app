import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/journey_started/presentation/widgets/border_only.dart';
import 'package:rideshare/features/journey_started/presentation/widgets/modal_with_two_button.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/images.dart';
import '../../../pick_location/domain/entities/ride_offer.dart';
// import 'package:rideshare/features/journey_started/presentation/widgets/border_only.dart';

class OnJourneyPassengersCard extends StatefulWidget {
  final RideOffer rideOffer;
  const OnJourneyPassengersCard({super.key, required this.rideOffer});

  @override
  State<OnJourneyPassengersCard> createState() =>
      _OnJourneyPassengersCardState();
}

class _OnJourneyPassengersCardState extends State<OnJourneyPassengersCard> {
  bool isButtonPressed = false;
  bool isButtonDisabled = false;

  TwoButtonModal showMyModal(BuildContext context) {
    return TwoButtonModal(
      title: "Drop Passenger",
      description: "Have you reached to the Passengers  destination?",
      firstButtonText: "Yes Drop",
      secondButtonText: "Back",
      firstButtonColor: primaryColor,
      secondButtonColor: primaryColor,
      onFirstButtonPressed: () {
        setState(() {
          isButtonPressed = true;
          isButtonDisabled = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isButtonPressed ? const Color.fromARGB(255, 228, 228, 228) : null,
      child: Padding(
        padding: EdgeInsets.all(1.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 7.w,
                  child: ClipOval(
                    child: Container(
                      width: 14.w,
                      height: 14.h,
                      child: Image.asset(
                        widget.rideOffer.user.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ), // Example placeholder
                ),
                SizedBox(width: 1.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: Text(
                        widget.rideOffer.user.fullname,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(map),
                        Text(
                          "5mins away",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: Row(
                        children: [
                          Image.asset(seats2),
                          Text(
                            "${widget.rideOffer.seatsAllocated}  seat",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Text(
              'Br ${widget.rideOffer.price}',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            // SizedBox(
            //   width: 10.w,
            // ),
            BorderOnlyButton(
              buttonText: "Drop",
              color: primaryColor,
              onPressed: isButtonDisabled
                  ? null
                  : () {
                      var modalWidget = showMyModal(context);
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return modalWidget;
                        },
                      );
                    },
              height: 5.h,
              width: 25.w,
            )
          ],
        ),
      ),
    );
  }
}

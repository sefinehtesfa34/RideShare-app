import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:rideshare/features/feeds/presentation/widgets/select_button.dart';
import 'package:rideshare/features/passenger_on_journey/presentation/widget/border_only_button.dart';
import '../../../../core/injections/injection_container.dart';
import '../../../../core/utils/colors.dart';

import '../bloc/cancel_ride_bloc/cancel_ride_bloc.dart';

class CancelRidePassengerModal extends StatelessWidget {
  const CancelRidePassengerModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CancelRideBloc>(
      create: (_) => sl<CancelRideBloc>(),
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Center(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Cancel Order',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                fontSize: 20.sp,
                color: modalTextColor,
              ),
            ),
          ),
        ),
        content: Text(
          "Do you want to cancel your order?",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            fontSize: 16.sp,
            color: modalTextColor,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          BlocConsumer<CancelRideBloc, CancelRideState>(
              builder: (context, state) {
            if (state is CancelRideSuccess ||
                state is CancelRideInitial ||
                state is CancelRideFailed) {
              return BorderOnlyButton(
                buttonText: 'Cancel',
                color: red,
                onPressed: () {
                  // context.read().of<CancelRideBloc>(context).add(CancelRideTrigger(rideRequestId: "some id",userPhone: "0961088592"));
                  BlocProvider.of<CancelRideBloc>(context).add(
                      CancelRideTrigger(
                          rideRequestId: "some id", userPhone: "0961088592"));
                },
              );
            } else if (state is CancelRideLoding) {
              return BorderOnlyButton(
                buttonText: 'Cancel',
                color: greyTextColor,
                onPressed: null,
              );
            }
            return SizedBox();
          }, listener: (context, state) {
            if (state is CancelRideSuccess && state.status == true) {
              Navigator.pop(context);
              print(state.status);
            }
            
          }),
          SizedBox(width: 3.w),
          BorderOnlyButton(
            buttonText: 'Back',
            color: primaryColor,
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

//? use this to add the modal
// showDialog(
//  context: context,
//  builder: (BuildContext context) {
//    return CancelRidePassengerModal();
//  });
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feed/presentation/widget/border_only_button.dart';
import '../../../../core/utils/colors.dart';
import '../bloc/passenger_home_bloc.dart';

class SearchCustomBottomSheet extends StatefulWidget {
  const SearchCustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<SearchCustomBottomSheet> createState() =>
      _SearchCustomBottomSheetState();
}

class _SearchCustomBottomSheetState extends State<SearchCustomBottomSheet> {
  late Timer _timer;
  bool _showAlmostThereText = false;

  @override
  void initState() {
    super.initState();

    // Start the timer
    _timer = Timer(Duration(seconds: 20), () {
      setState(() {
        _showAlmostThereText = true;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<SlidingContainerBloc, SlidingContainerState>(
      builder: (BuildContext context, SlidingContainerState state) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: state is SearchDriverContainerVisibleState ? 200 : 0,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 20,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: Column(
                  children: [
                    Text(
                      _showAlmostThereText
                          ? 'Almost there'
                          : 'Searching for driver',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    SpinKitThreeBounce(
                      color: primaryColor,
                      size: 5.h,
                    ),
                    SizedBox(height: 5.h),
                    BorderOnlyButton(
                      buttonText: "Cancel",
                      color: Colors.red,
                      onPressed: () {
                        final bloc = context.read<SlidingContainerBloc>();
                        bloc.add(
                            CancelEvent()); // Dispatch the CancelEvent to the bloc
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

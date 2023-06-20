import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feed/presentation/widget/border_only_button.dart';
import '../../../../core/utils/colors.dart';

class SearchCustomBottomSheet extends StatefulWidget {
  const SearchCustomBottomSheet({Key? key}) : super(key: key);

  @override
  _SearchCustomBottomSheetState createState() =>
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
    // Cancel the timer to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: 40.h,
          width: MediaQuery.of(context).size.width,
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
                Positioned(
                    child: Text(
                  _showAlmostThereText
                      ? 'Almost there'
                      : 'Searching for driver',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                SizedBox(
                  height: 7.h,
                ),
                const Positioned(
                  child: SpinKitThreeBounce(
                    color: primaryColor,
                    size: 52,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Positioned(
                    child: BorderOnlyButton(
                        buttonText: "Cancel",
                        color: Colors.red,
                        onPressed: () {}))
              ],
            ),
          )),
    );
  }
}

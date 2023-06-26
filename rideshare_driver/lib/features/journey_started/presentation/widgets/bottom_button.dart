import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/colors.dart';
import 'package:rideshare/features/journey_started/presentation/widgets/border_only.dart';
import 'package:rideshare/features/journey_started/presentation/widgets/modal_with_two_button.dart';

class BottomButton extends StatelessWidget {
  TwoButtonModal showMyModal(BuildContext context) {
    return TwoButtonModal();
  }

  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: double.infinity,
      // margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: BeveledRectangleBorder(),
            backgroundColor: white,
          ),
          child: BorderOnlyButton(
            buttonText: "Cancel",
            color: red,
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
            height: 5.h,
            width: 26.w,
          )),
    );
  }
}

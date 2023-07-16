import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';
import '../../../pick_passengers/presentation/widgets/border_only_button.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: double.infinity,
      // margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(shape: BeveledRectangleBorder(),
          backgroundColor: white,
        ),
        child: BorderOnlyButton(buttonText: "Cancel", color: red, onPressed: (){})
      ),
    );
  }
}
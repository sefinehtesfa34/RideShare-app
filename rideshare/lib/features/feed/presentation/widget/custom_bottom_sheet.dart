import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
              color: white,
              width: double.infinity,
              height: 30.h,
              child: Center(child: Text("Bottomsheet")));
        });
  }
}

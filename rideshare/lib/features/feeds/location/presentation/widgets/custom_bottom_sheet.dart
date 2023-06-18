import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return Container(
              color: const Color(0xFFFFFFFF),
              width: double.infinity,
              height: 30.h,
              child: const Center(child: Text("Bottomsheet")));
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Back extends StatelessWidget {
  const Back({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.sp, left: 15.sp),
      child: GestureDetector(
        // ignore: always_specify_types
        onTap: () => {
          Navigator.pop(context),
        },
        child: SvgPicture.asset('images/back.svg'),
      ),
    );
  }
}

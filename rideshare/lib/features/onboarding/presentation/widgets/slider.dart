import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SliderPage extends StatelessWidget {
  final Color color;
  final double width;
  const SliderPage({
    Key? key,
    required this.color,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.w),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6.0,
                ),
              ],
            ),
            width: width,
            height: 1.h,
            // color: Colors.blue,
          )
        ]),
      ),
    );
  }
}

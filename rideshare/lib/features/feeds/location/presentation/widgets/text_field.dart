// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class LocationTextField extends StatefulWidget {
//   const LocationTextField({super.key, required this.hintText});
//   final String hintText;

//   @override
//   State<LocationTextField> createState() => _LocationTextFieldState();
// }

// class _LocationTextFieldState extends State<LocationTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       style: TextStyle(
//           color: const Color(0XFF1E1E1E),
//           fontWeight: FontWeight.w500,
//           fontSize: 16.sp,
//           fontFamily: 'Poppins'),
//       decoration: InputDecoration(
//         enabledBorder: const OutlineInputBorder(
//           borderSide: BorderSide.none,
//         ),
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide.none,
//         ),
//         fillColor: const Color(0XFFE5E3F2),
//         filled: true,
//         border: const OutlineInputBorder(),
//         hintText: widget.hintText,
//         hintStyle: TextStyle(
//             color: const Color(0XFFA0A0A0),
//             fontFamily: 'Poppins',
//             fontWeight: FontWeight.w500,
//             fontSize: 16.sp),
//         suffixIcon: Transform.scale(
//           scale: 0.5,
//           child: SvgPicture.asset(
//             'images/star.svg',
//           ),
//         ),
//       ),
//     );
//   }
// }

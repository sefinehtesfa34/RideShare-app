import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationTextField extends StatefulWidget {
  const LocationTextField({super.key, required this.hintText});
  final String hintText;

  @override
  State<LocationTextField> createState() => _LocationTextFieldState();
}

class _LocationTextFieldState extends State<LocationTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        fillColor: const Color(0XFFE5E3F2),
        filled: true,
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
        suffixIcon: Transform.scale(
          scale: 0.5,
          child: SvgPicture.asset(
            'images/star.svg',
          ),
        ),
      ),
    );
  }
}

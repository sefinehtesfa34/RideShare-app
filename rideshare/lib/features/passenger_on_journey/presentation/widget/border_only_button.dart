import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';


/// This widget represents a button with a border and a customizable color.
class BorderOnlyButton extends StatelessWidget {
  /// The text to be displayed on the button.
  final String buttonText;

  /// The color of the button.
  final Color color;

  /// Callback function to be called when the button is pressed.
  final void Function()? onPressed;

  /// Creates a [BorderOnlyButton].
  ///
  /// The [buttonText] parameter specifies the text to be displayed on the button.
  /// The [color] parameter specifies the color of the button.
  /// The [onPressed] parameter is a callback function called when the button is pressed.
  const BorderOnlyButton({
    required this.buttonText,
    required this.color,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: color),
          ),
          backgroundColor: white,
          foregroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}

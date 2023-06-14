import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key, required this.hintText})
      : super(key: key);
  final String hintText;

  @override
  State<SearchTextField> createState() =>
      _SearchTextFieldState();
}

class _SearchTextFieldState
    extends State<SearchTextField> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<AutoCompleteTextFieldState<String>> _key = GlobalKey();
  final List<String> _cities = <String>[
    'New York',
    'San Francisco',
    'Seattle',
    'Chicago',
    'Los Angeles',
    // Add more cities as needed
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoCompleteTextField<String>(
      key: _key,
      controller: _controller,
      suggestions: _cities,
      decoration: decoration(widget.hintText),
      itemSubmitted: (String item) {
        setState(() {
          _controller.text = item;
        });
      },
      itemBuilder: (BuildContext context, String item) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _controller.text = item;
            });
          },
          child: ListTile(
            title: Text(item),
          ),
        );
      },
      itemSorter: (String a, String b) {
        return a.compareTo(b);
      },
      itemFilter: (String item, String query) {
        return item.toLowerCase().startsWith(query.toLowerCase());
      },
    );
  }
}

InputDecoration decoration(String hintText) {
  return InputDecoration(
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
    fillColor: const Color(0XFFE5E3F2),
    filled: true,
    border: const OutlineInputBorder(),
    hintText: hintText,
    hintStyle: TextStyle(
        color: const Color(0XFFA0A0A0),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 16.sp),
    suffixIcon: Transform.scale(
      scale: 0.5,
      child: SvgPicture.asset(
        'images/star.svg',
      ),
    ),
  );
}

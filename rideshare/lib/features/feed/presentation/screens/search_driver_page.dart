import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widget/back_button.dart';
import '../widget/search_driver.dart';

class SlideUpContainerPage extends StatefulWidget {
  @override
  _SlideUpContainerPageState createState() => _SlideUpContainerPageState();
}

class _SlideUpContainerPageState extends State<SlideUpContainerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;

  bool _isContainerVisible = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleContainerVisibility() {
    setState(() {
      _isContainerVisible = !_isContainerVisible;

      if (_isContainerVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12.withOpacity(0.5),
      body: Stack(
        children: [
          Positioned(child: back(), top: 6.h, left: 6.w),
          Center(
            child: TextButton(
              onPressed: _toggleContainerVisibility,
              child: Text('Submit'),
            ),
          ),
          // Sliding container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: _slideAnimation.value,
              // color: white,
              child: Center(child: SearchCustomBottomSheet()),
            ),
          ),
        ],
      ),
    );
  }
}
// class SearchDriverPage extends StatelessWidget {
//   const SearchDriverPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.black.withOpacity(0.5),
//       body: Stack(children: [
//         // CurrentLocationMap(),
//         Positioned(child: back(), top: 6.h, left: 6.w),
//         Positioned(bottom: 0, child: SearchCustomBottomSheet()),
        
//       ]),
//     );
//   }
// }

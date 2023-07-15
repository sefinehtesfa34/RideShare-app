import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../bloc/sliding_container/sliding_container_bloc.dart';
class SlideUpContainerPage extends StatefulWidget {
  @override
  _SlideUpContainerPageState createState() => _SlideUpContainerPageState();

  void showSearchBottomSheet(BuildContext context) {}
}

class _SlideUpContainerPageState extends State<SlideUpContainerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  final SlidingContainerBloc _slidingContainerBloc = SlidingContainerBloc();

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

  void showSearchBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // return SearchCustomBottomSheet();
        return Center();
      },
    );

    _toggleContainerVisibility();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: _slideAnimation.value,
            child: GestureDetector(
              onTap: () {
                _toggleContainerVisibility();
              },
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 25,
                        ),
                        onPressed: () {
                          _toggleContainerVisibility();
                        },
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            showSearchBottomSheet(context);
                          },
                          child: Text('Show Bottom Sheet'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}

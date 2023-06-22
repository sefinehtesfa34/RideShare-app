import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/location_marker.dart';

class JourneyStarted extends StatefulWidget {
  const JourneyStarted({Key? key}) : super(key: key);

  @override
  State<JourneyStarted> createState() => _JourneyStartedState();
}

class _JourneyStartedState extends State<JourneyStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: 100.h,
            child: CustomizeMarker(),
          ),
        ],
      ),
    );
  }
}

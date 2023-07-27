import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:rideshare/core/utils/colors.dart';
import 'package:rideshare/features/pick_location/presentation/bloc/passenger_home_bloc.dart';
import 'package:rideshare/features/pick_location/presentation/widgets/custom_bottom_sheet.dart';
import 'dart:async';

import 'package:rideshare/features/pick_location/presentation/widgets/google_map_viewer.dart';

import '../widgets/choose_location.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({super.key});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1, end: 2).animate(_animationController);

    BlocProvider.of<CurrentLocationBloc>(context)
        .add(FetchCurrentLocationEvent());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentLocationBloc, CurrentLocationState>(
      builder: (context, state) {
        if (state is CurrentLocationSuccess) {
          return Scaffold(
              body: SafeArea(
                child: Stack(
                          children: [
                GoogleMapViewer(
                  latitude: state.location.latitude,
                  longitude: state.location.longitude,
                ),
                CustomBottomSheet(),
                          ],
                        ),
              ));
        } else if (state is CurrentLocationLoading) {
          return Scaffold(
            body: Center(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) { 
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ride',
                        style: TextStyle(
                          fontSize: 32 * _animation.value,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Share",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 32 * _animation.value,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                  Text('Please allow location access in setting to continue'),
                ],
              ),
            ),
          );
        }
      },
      listener: (context, state) {
        // Execute side effects for CurrentLocationState
      },
    );
  }
}

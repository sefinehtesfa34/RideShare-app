import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rideshare/features/pick_location/presentation/bloc/passenger_home_bloc.dart';
import '../widgets/bottom_button.dart';
// import '../widgets/google_map_viewer.dart';
import '../widgets/google_map_viewer.dart';
import '../widgets/pick_passengers_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickPassengersPage extends StatefulWidget {
  const PickPassengersPage(
      {Key? key,
      required this.sourceLocation,
      required this.destinationLocation})
      : super(key: key);
  final LatLng sourceLocation;
  final LatLng destinationLocation;
  @override
  State<PickPassengersPage> createState() => _PickPassengersPageState();
}

class _PickPassengersPageState extends State<PickPassengersPage> {
  double latitude = 9.005401;
  double longitude = 38.763611;

  void initState() {
    super.initState();
    CurrentLocationBloc bloc = BlocProvider.of<CurrentLocationBloc>(context);
    CurrentLocationState state = bloc.state;
    if (state is CurrentLocationSuccess) {
      print("============================= $latitude, $longitude");
      latitude = state.location.latitude;
      longitude = state.location.longitude;
      print("============================= $latitude, $longitude");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            GoogleMapViewer(
              latitude: latitude,
              longitude: longitude,
            ),
            CustomBottomSheet(),
          ],
        ),
        bottomNavigationBar: BottomButton(
          sourceLocation: widget.sourceLocation,
          destinationLocation: widget.destinationLocation,
        ));
  }
}

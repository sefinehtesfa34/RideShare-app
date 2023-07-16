import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../journey_started/presentation/widgets/google_map_viewer.dart';
import '../../../pick_location/presentation/bloc/passenger_home_bloc.dart';
import '../../domain/entity/ride_request.dart';
import '../widgets/bottom_button.dart';
// import '../widgets/google_map_viewer.dart';
import '../widgets/pick_passengers_bottom_sheet.dart';

class PickPassengersPage extends StatefulWidget {
  final RideRequest rideRequest;
  final LatLng sourceLocation;
  final LatLng destinationLocation;

  const PickPassengersPage(
      {Key? key,
      required this.rideRequest,
      required this.sourceLocation,
      required this.destinationLocation})
      : super(key: key);

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
              passengers: [],
              source: widget.sourceLocation,
              destination: widget.destinationLocation,
            ),
            CustomBottomSheet(rideRequest: widget.rideRequest),
          ],
        ),
        bottomNavigationBar: BottomButton(
          sourceLocation: widget.sourceLocation,
          destinationLocation: widget.destinationLocation,
        ));
  }
}

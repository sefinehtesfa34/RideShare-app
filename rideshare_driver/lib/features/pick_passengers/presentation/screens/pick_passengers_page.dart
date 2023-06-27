import 'package:flutter/material.dart';
import '../../domain/entity/ride_request.dart';
import '../widgets/bottom_button.dart';
// import '../widgets/google_map_viewer.dart';
import '../widgets/pick_passengers_bottom_sheet.dart';

class PickPassengersPage extends StatelessWidget {
  final RideRequest rideRequest;
  
  const PickPassengersPage({Key? key, required this.rideRequest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            CustomBottomSheet(rideRequest: rideRequest),
          ],
        ),
        bottomNavigationBar: BottomButton());
  }
}

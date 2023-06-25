import 'package:flutter/material.dart';
import '../widgets/bottom_button.dart';
// import '../widgets/google_map_viewer.dart';
import '../widgets/pick_passengers_bottom_sheet.dart';

class PickPassengersPage extends StatelessWidget {
  const PickPassengersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
          children: [
            // GoogleMapViewer(latitude: 9.005401, longitude: 38.763611),
            CustomBottomSheet(),
          ],
        ),
        bottomNavigationBar: BottomButton());
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/injection.dart';
import 'features/feeds/location/presentation/screen/location_marker.dart';
import 'features/feeds/location/presentation/screen/picking_location.dart';
import 'features/feeds/location/presentation/widgets/follow_path.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation,
          ScreenType screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color.fromRGBO(109, 97, 242, 1),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: const OtpVerificationScreen(),
          // home: const FollowFab(),
          // home: const CustomizeMarker(),
          home: const LocationPickerPage(),
          // home:  const LocationMap(currentLatitude: 20, currentLongitude: 20, destinationLatitude: 89, destinationLongitude: 90),
          // home: const LatLngScreenPointTestPage(),
          // home:const SelectableDistanceFilterExample()
        );
      },
    );
  }
}

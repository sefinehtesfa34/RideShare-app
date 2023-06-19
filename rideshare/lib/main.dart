import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/injection.dart';
import 'features/feeds/location/presentation/bloc/location_bloc.dart';
import 'features/feeds/location/presentation/screen/picking_location.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  GetIt instance = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation,
          ScreenType screenType) {
        return BlocProvider<LocationBloc>(
          create: (BuildContext context) => instance(),
          child: MaterialApp(
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
          ),
        );
      },
    );
  }
}

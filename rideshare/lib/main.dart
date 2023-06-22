import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/sign_up_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/back_to_location/bloc/back_to_location_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/location_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/screen/picking_location.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'injection_container.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpBloc>(
          create: (_) => sl<SignUpBloc>(),
        ),
        BlocProvider<LocationBloc>(
          create: (BuildContext context) => sl(),
        ),
        BlocProvider<BackToLocationBloc>(
            create: (_) => sl<BackToLocationBloc>())
      ],
      child: ResponsiveSizer(
        builder: (BuildContext context, Orientation orientation, ScreenType screenType) {
          return MaterialApp(
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rideshare/features/authentication/presentation/screens/sign_up_page.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/back_to_location/bloc/back_to_location_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/location_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'features/passenger/presentation/bloc/ride_request_bloc/ride_request_bloc.dart';
import 'injection_container.dart' as injection;
import 'features/authentication/presentation/bloc/signup/bloc/signup_bloc.dart';

Position? curPos;
void main() async {
  await injection.init();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<SignUpBloc>(
      create: (_) => injection.sl<SignUpBloc>(),
    ),
    BlocProvider<LocationBloc>(
      create: (BuildContext context) => injection.sl<LocationBloc>(),
    ),
    BlocProvider<BackToLocationBloc>(
        create: (_) => injection.sl<BackToLocationBloc>()),
    BlocProvider<RideRequestBloc>(
      create: (_) => injection.sl<RideRequestBloc>(),
    )
  ], child: const MyApp()));
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
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignUpPage(),
        );
      },
    );
  }
}

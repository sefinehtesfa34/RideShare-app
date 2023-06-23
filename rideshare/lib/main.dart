import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/core/routes/app_routes.dart';
import 'package:rideshare/features/authentication/presentation/bloc/login/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/sign_up_bloc.dart';
import 'package:rideshare/features/authentication/presentation/screens/sign_up_page.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/back_to_location/bloc/back_to_location_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/location_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/pick_location/presentation/screen/location_picker.dart';
import 'features/pick_location/presentation/bloc/passenger_home_bloc.dart';
import 'injection_container.dart' as di;

import 'core/location/location.dart';
import 'core/routes/app_routes.dart';
import 'core/utils/colors.dart';
import 'features/passenger/domain/entities/location.dart';
import 'features/passenger/domain/entities/ride_offer.dart';
import 'features/passenger/presentation/bloc/ride_request_bloc/ride_request_bloc.dart';
import 'features/authentication/presentation/bloc/signup/bloc/signup_bloc.dart';
import 'core/injections/injection_container.dart' as injection;

void main() async {
  await injection.init();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<LoginBloc>(create: (_) => injection.sl<LoginBloc>()),
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
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  GetIt instance = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpBloc>(
          create: (_) => di.sl<SignUpBloc>(),
        ),
        BlocProvider<LocationBloc>(
          create: (BuildContext context) => instance(),
        ),
        BlocProvider<BackToLocationBloc>(
          create: (_) => di.sl<BackToLocationBloc>(),
        ),
        BlocProvider<NamesBloc>(create: (_) => di.sl<NamesBloc>()),
        BlocProvider<ChooseLocationsBloc>(
            create: (_) => di.sl<ChooseLocationsBloc>()),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: const Color.fromRGBO(109, 97, 242, 1),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            // home: const OtpVerificationScreen(),
            // home: const FollowFab(),
            // home: const CustomizeMarker(),
            // home: const LocationPickerPage(),
            // home: const PassengerHomePage(),
            home: const LocationPicker(),
            // home:  const LocationMap(currentLatitude: 20, currentLongitude: 20, destinationLatitude: 89, destinationLongitude: 90),
            // home: const LatLngScreenPointTestPage(),
            // home:const SelectableDistanceFilterExample()
          );
        },
      ),
    );
  }
}

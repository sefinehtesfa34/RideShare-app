import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/core/routes/app_routes.dart';
import 'package:rideshare/features/authentication/presentation/bloc/login/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/back_to_location/bloc/back_to_location_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/location_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'features/pick_location/presentation/bloc/passenger_home_bloc.dart';

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
          create: (_) => injection.sl<SignUpBloc>(),
        ),
        BlocProvider<LocationBloc>(
          create: (BuildContext context) => instance(),
        ),
        BlocProvider<BackToLocationBloc>(
          create: (_) => injection.sl<BackToLocationBloc>(),
        ),
        BlocProvider<NamesBloc>(create: (_) => injection.sl<NamesBloc>()),
        BlocProvider<ChooseLocationsBloc>(
            create: (_) => injection.sl<ChooseLocationsBloc>()),
        BlocProvider<CurrentLocationBloc>(
            create: (_) => injection.sl<CurrentLocationBloc>()),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return SafeArea(
            child: AppRouter(),
          );
        },
      ),
    );
  }
}

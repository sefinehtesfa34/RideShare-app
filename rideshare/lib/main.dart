import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rideshare/features/authentication/presentation/bloc/otp_bloc.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/sign_up_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/back_to_location/bloc/back_to_location_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/location_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feeds/profile/presentation/bloc/update_profile_bloc.dart';
import 'package:rideshare/passenger_profile_injection.dart';
import 'features/authentication/presentation/screens/otp.dart';
import 'features/feeds/profile/presentation/screen/passenger_profile.dart';
import 'injection_container.dart' as di;
import 'passenger_profile_injection.dart' as pp;

void main() async {
  await di.init();
  await pp.passengerProfileInjection();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<UpdateProfileBloc>(
          create: (_) => di.sl<UpdateProfileBloc>(),
        ),
        BlocProvider<OtpVerificationBloc>(
          create: (_) => di.sl<OtpVerificationBloc>(),
        ),
        BlocProvider<SignUpBloc>(
          create: (_) => di.sl<SignUpBloc>(),
        ),
        BlocProvider<LocationBloc>(
          create: (BuildContext context) => instance(),
        ),
        BlocProvider<BackToLocationBloc>(
            create: (_) => di.sl<BackToLocationBloc>())
      ],
      child: ResponsiveSizer(
        builder: (BuildContext context, Orientation orientation,
            ScreenType screenType) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: const Color.fromRGBO(109, 97, 242, 1),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            // home: const OtpVerificationScreen(),
            // home: const FollowFab(),
            // home: const CustomizeMarker(),
            home: const ProfilePage(),
            // home:  const LocationMap(currentLatitude: 20, currentLongitude: 20, destinationLatitude: 89, destinationLongitude: 90),
            // home: const LatLngScreenPointTestPage(),
            // home:const SelectableDistanceFilterExample()
          );
        },
      ),
    );
  }
}

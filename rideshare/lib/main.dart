import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rideshare/features/authentication/presentation/bloc/otp_bloc.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/sign_up_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/back_to_location/bloc/back_to_location_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/location_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'features/authentication/presentation/screens/otp.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
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
      builder: ((BuildContext context, Orientation orientation,
          ScreenType screenType) {
        return BlocProvider<UpdateProfileBloc>(
          create: (BuildContext context) => GetIt.instance(),
          child: const MaterialApp(
            title: 'Image Picker Demo',
            // home: MyHomePage(),
            // home: HistoryPage(),
            home: ProfilePage(),
          ),
        );
      }),
    );
  }
}
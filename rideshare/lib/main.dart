import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feeds/profile/presentation/bloc/update_profile_bloc.dart';
import 'features/authentication/presentation/screen/otp.dart';
import 'injection_container.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: ((BuildContext context, Orientation orientation,
          ScreenType screenType) {
        return BlocProvider<UpdateProfileBloc>(
          create: (BuildContext context) => GetIt.instance(),
          child: const MaterialApp(
            // home: MyHomePage(),
            home: OtpVerificationScreen(),
            // home: HistoryPage(),
            // home: ProfilePage(),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/pick_passengers/presentation/screens/pick_passengers_page.dart';
import './features/authentication/presentation/screens/sign_up_page.dart';
import './features/authentication/presentation/bloc/signup/sign_up_bloc.dart';
import 'features/journey_started/presentation/screens/journey_started_page.dart';
import 'injection_container.dart' as di;

void main() async {
  // await di.init();
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
      theme: ThemeData(
        primaryColor: const Color(0xFF433AA9),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: JourneyStartedPage(),
    );;
      },
    );

    // MultiBlocProvider(
    //   providers: [
    //     BlocProvider<SignUpBloc>(
    //       create: (_) => di.sl<SignUpBloc>(),
    //     ),
    //   ],
    //   child: ResponsiveSizer(
    //     builder: (context, orientation, screenType) {
    //       return MaterialApp(
    //         theme: ThemeData(
    //           primaryColor: const Color(0xFF433AA9),
    //           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //           useMaterial3: true,
    //         ),
    //         home: SignUpPage(),
    //       );
    //     },
    //   ),
    // );
  }
}

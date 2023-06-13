import 'package:flutter/material.dart';
import 'package:rideshare/features/onboarding/presentation/screen/onboarding_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'features/authentication/presentation/screen/otp.dart';
import 'features/feed/presentation/screens/passenger_on_journey_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color.fromRGBO(109, 97, 242, 1),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: PassengerOnJourneyPage(),
        );
      },
    );
  }
}

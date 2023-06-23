import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:rideshare/core/routes/route_paths.dart';
import 'package:rideshare/features/authentication/presentation/screens/login_page.dart';
import 'package:rideshare/features/authentication/presentation/screens/otp.dart';
import 'package:rideshare/features/authentication/presentation/screens/sign_up_page.dart';
import 'package:rideshare/features/onboarding/presentation/screen/onboarding_page_one.dart';
import 'package:rideshare/features/onboarding/presentation/screen/onboarding_page_three.dart';
import 'package:rideshare/features/onboarding/presentation/screen/onboarding_page_two.dart';
import 'package:rideshare/features/passenger/presentation/screens/passenger_on_journey_page.dart';
import 'package:rideshare/features/pick_location/presentation/widgets/choose_location.dart';
import 'package:rideshare/features/pick_location/presentation/widgets/map_picker.dart';

import '../../features/feeds/location/presentation/screen/picking_location.dart';
import '../../features/onboarding/presentation/screen/onboarding_holder.dart';
import '../../features/passenger/presentation/screens/ride_completed.dart';
import '../../features/passenger/presentation/screens/searching_for_ride_page.dart';
import '../utils/colors.dart';

class AppRouter extends StatelessWidget {
  late final GoRouter _router;

  AppRouter({Key? key}) : super(key: key) {
    _router = GoRouter(
      initialLocation: RoutePaths.onboardingPageOne,
      routes: <GoRoute>[
        GoRoute(
          path: RoutePaths.locationPicker,
          builder: (BuildContext context, GoRouterState state) =>
              const LocationPickerPage(),
        ),
        GoRoute(
          path: RoutePaths.home,
          builder: (BuildContext context, GoRouterState state) =>
              SearchingforRidePage(),
        ),
        GoRoute(
          path: RoutePaths.onJourney,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map<String, dynamic>;

            return PassengerOnJourneyPage(
              passenger: extra["passenger"],
            );
          },
        ),
        GoRoute(
          path: RoutePaths.onboardingPageOne,
          builder: (BuildContext context, GoRouterState state) =>
              const OnBoardingHolder(),
        ),
        // GoRoute(
        //   path: RoutePaths.onboardingPageTwo,
        //   builder: (BuildContext context, GoRouterState state) =>
        //       const OnboardingPageTwo(),
        // ),
        // GoRoute(
        //   path: RoutePaths.onboardingPageThree,
        //   builder: (BuildContext context, GoRouterState state) =>
        //       const OnboardingPageThree(),
        // ),
        GoRoute(
          path: RoutePaths.signUp,
          builder: (BuildContext context, GoRouterState state) =>
              const SignUpPage(),
        ),
        GoRoute(
          path: RoutePaths.login,
          builder: (BuildContext context, GoRouterState state) =>
              const LoginPage(),
        ),
        GoRoute(
          path: RoutePaths.verify,
          builder: (BuildContext context, GoRouterState state) =>
              const OtpVerificationScreen(),
        ),
        GoRoute(
            path: RoutePaths.rideCompletePassenger,
            builder: (BuildContext context, GoRouterState state) {
              var extra = state.extra as Map<String, dynamic>;
              return RideCompletePassenger(
                  totalCost: extra['totalCost'], tip: extra['tip']);
            }),

        GoRoute(
            path: RoutePaths.pickLocation,
            builder: (BuildContext context, GoRouterState state) {
              var extra = state.extra as Map<String, dynamic>;

              return ChooseLocation(
                places: extra['places'],
              );
            }),
        GoRoute(
            path: RoutePaths.pickPassengerOnMap,
            builder: (BuildContext context, GoRouterState state) {
              var extra = state.extra as Map<String, dynamic>;
              return MapPicker(
                controller: extra["controller"],
              );
            }),
        GoRoute(
            path: RoutePaths.passengerHome,
            builder: (BuildContext context, GoRouterState state) =>
                LocationPickerPage()),
        GoRoute(
            path: RoutePaths.locationPicker,
            builder: (BuildContext context, GoRouterState state) =>
                LocationPickerPage()),
        GoRoute(
            path: RoutePaths.home,
            builder: (BuildContext context, GoRouterState state) =>
                SearchingforRidePage()),
        GoRoute(
            path: RoutePaths.onJourney,
            builder: (BuildContext context, GoRouterState state) {
              var extra = state.extra as Map<String, dynamic>;

              return PassengerOnJourneyPage(
                passenger: extra["passenger"],
              );
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
      );
}

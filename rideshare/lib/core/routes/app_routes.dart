import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:rideshare/core/routes/route_paths.dart';
import 'package:rideshare/features/authentication/presentation/screens/login_page.dart';
import 'package:rideshare/features/authentication/presentation/screens/sign_up_page.dart';
import 'package:rideshare/features/passenger_on_journey/presentation/screens/passenger_on_journey_page.dart';
import 'package:rideshare/features/pick_location/presentation/screen/location_picker.dart';
import 'package:rideshare/features/pick_location/presentation/widgets/choose_location.dart';
import 'package:rideshare/features/pick_location/presentation/widgets/map_picker.dart';

import '../../features/feeds/presentation/screen/picking_location.dart';
import '../../features/onboarding/presentation/screen/onboarding_holder.dart';
import '../../features/passenger_on_journey/presentation/screens/ride_completed.dart';
import '../../features/passenger_on_journey/presentation/screens/searching_for_ride_page.dart';
import '../../features/authentication/presentation/screens/otp_verification_page.dart';
import '../../features/profile/presentation/screen/passenger_profile.dart';
import '../utils/colors.dart';

class AppRouter extends StatelessWidget {
  late final GoRouter _router;

  AppRouter({Key? key}) : super(key: key) {
    _router = GoRouter(
      initialLocation: RoutePaths.passengerHome,
      routes: <GoRoute>[
        GoRoute(
          path: RoutePaths.profile,
          builder: (BuildContext context, GoRouterState state) =>
              const ProfilePage(),
        ),
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
                intialLocation: extra["intialLocation"],
              );
            }),
        GoRoute(
            path: RoutePaths.passengerHome,
            builder: (BuildContext context, GoRouterState state) =>
                const LocationPicker()),
        GoRoute(
            path: RoutePaths.locationPicker,
            builder: (BuildContext context, GoRouterState state) =>
                const LocationPicker()),
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

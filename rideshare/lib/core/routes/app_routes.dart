import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:rideshare/core/routes/route_paths.dart';
import 'package:rideshare/features/passenger/presentation/screens/passenger_on_journey_page.dart';

import '../../features/feeds/location/presentation/screen/picking_location.dart';
import '../../features/passenger/presentation/screens/searching_for_ride_page.dart';
import '../utils/colors.dart';

class AppRouter extends StatelessWidget {
  late final GoRouter _router;

  AppRouter({Key? key}) : super(key: key) {
    _router = GoRouter(
      initialLocation: RoutePaths.locationPicker,
      routes: <GoRoute>[
        GoRoute(path: RoutePaths.locationPicker,builder :(BuildContext context,GoRouterState state) => LocationPickerPage()),
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      );
}

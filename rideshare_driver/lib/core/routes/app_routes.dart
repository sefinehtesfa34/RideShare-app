import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:rideshare/core/routes/route_paths.dart';

import '../../features/journey_started/presentation/screens/journey_started_page.dart';
import '../../features/pick_location/presentation/screen/location_picker.dart';
import '../../features/pick_location/presentation/widgets/choose_location.dart';
import '../../features/pick_location/presentation/widgets/map_picker.dart';
import '../../features/pick_passengers/presentation/screens/pick_passengers_page.dart';
import '../utils/colors.dart';

class AppRouter extends StatelessWidget {
  late final GoRouter _router;

  AppRouter({Key? key}) : super(key: key) {
    _router = GoRouter(
      initialLocation: RoutePaths.passengerHome,
      routes: <GoRoute>[
        GoRoute(
            path: RoutePaths.driverOnjourney,
            builder: (BuildContext context, GoRouterState state) {
              var extra = state.extra as Map<String, dynamic>;
              return JourneyStartedPage(
                currentLocation: extra["currentLocation"],
                destination: extra["destination"],
                passengers: extra["passengers"],
              );
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
            path: RoutePaths.driverPickup,
            builder: (BuildContext context, GoRouterState state) {
              var extra = state.extra as Map<String, dynamic>;

              return PickPassengersPage(
                rideRequest: extra['rideRequest'],
                sourceLocation: extra['sourceLocation'],
                destinationLocation: extra["destinationLocation"],
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

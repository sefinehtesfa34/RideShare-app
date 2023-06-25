import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:rideshare/core/routes/route_paths.dart';

import '../../features/journey_started/presentation/screens/journey_started_page.dart';
import '../utils/colors.dart';

class AppRouter extends StatelessWidget {
  late final GoRouter _router;

  AppRouter({Key? key}) : super(key: key) {
    _router = GoRouter(
      initialLocation: RoutePaths.driverOnjourney,
      routes: <GoRoute>[
        GoRoute(
          path: RoutePaths.driverOnjourney,
          builder: (BuildContext context, GoRouterState state) =>
              const JourneyStartedPage(),
        ),
              
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

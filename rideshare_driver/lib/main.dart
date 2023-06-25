import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/injections/injection_container.dart' as injection;
import 'core/routes/app_routes.dart';
import 'features/pick_location/presentation/bloc/passenger_home_bloc.dart';
import 'features/pick_location/presentation/bloc/ride_request_bloc/ride_request_bloc.dart';

void main() async {
  await injection.init();

  // runApp(MultiBlocProvider(providers: [

  // ], child: MyDriverApp()));

  runApp(MyDriverApp());
}

class MyDriverApp extends StatelessWidget {
  MyDriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrentLocationBloc>(
            create: (_) => injection.sl<CurrentLocationBloc>()),
        BlocProvider<NamesBloc>(create: (_) => injection.sl<NamesBloc>()),
        BlocProvider<ChooseLocationsBloc>(
            create: (_) => injection.sl<ChooseLocationsBloc>()),
        BlocProvider<RideRequestBloc>(
          create: (_) => injection.sl<RideRequestBloc>(),
        )
      ],
      child: ResponsiveSizer(
        builder: (BuildContext context, Orientation orientation,
            ScreenType screenType) {
          return AppRouter();
        },
      ),
    );
  }
}

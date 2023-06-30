import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/pick_passengers/presentation/bloc/fetch_passengers/fetch_passengers_bloc.dart';
import 'core/injections/injection_container.dart' as injection;
import 'core/injections/injection_container.dart';
import 'core/routes/app_routes.dart';
import 'features/pick_location/presentation/bloc/passenger_home_bloc.dart';
import 'features/pick_location/presentation/bloc/ride_request_bloc/ride_request_bloc.dart';
import 'features/pick_passengers/presentation/bloc/pick_passengers/pick_passengers_bloc.dart';
import 'features/pick_passengers/presentation/bloc/sorting_selector/sorting_selector_bloc.dart';

void main() async {
  await injection.init();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<PickPassengersBloc>(
      create: (_) => sl<PickPassengersBloc>(),
    ),
    BlocProvider<FetchPassengersBloc>(
      create: (_) => sl<FetchPassengersBloc>(),
    ),
    BlocProvider<SortingSelectorBloc>(
      create: (_) => sl<SortingSelectorBloc>(),
    )
  ], child: MyDriverApp()));
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
          return SafeArea(
            child: AppRouter(),
          );
        },
      ),
    );
  }
}

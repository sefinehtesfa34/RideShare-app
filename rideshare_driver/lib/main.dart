import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/injections/injection_container.dart' as injection;
import 'core/routes/app_routes.dart';

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
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation,
          ScreenType screenType) {
        return AppRouter();
      },
    );
  }
}

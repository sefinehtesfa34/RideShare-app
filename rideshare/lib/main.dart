import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/sign_up_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/back_to_location/bloc/back_to_location_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/bloc/location_bloc.dart';
import 'package:rideshare/features/feeds/location/presentation/screen/picking_location.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'features/feeds/profile/presentation/screen/drawer.dart';
import 'features/feeds/profile/presentation/screen/passengers_history_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: ((BuildContext context, Orientation orientation,
          ScreenType screenType) {
        return const MaterialApp(
          title: 'Image Picker Demo',
          // home: MyHomePage(),
          home: HistoryPage(),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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

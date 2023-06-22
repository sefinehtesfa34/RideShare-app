import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feeds/profile/presentation/widgets/rides_history.dart';

import '../../../../../constants/json.dart';
import '../widgets/histsory_list_tile.dart';
import '../widgets/special_appbar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16.sp, left: 16.sp),
              child: const SpecialAppbar(title: 'History'),
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: ListView.builder(
                itemCount: historyList.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, String> historyItem = historyList[index];

                  return HistoryListTile(historyItem: historyItem);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

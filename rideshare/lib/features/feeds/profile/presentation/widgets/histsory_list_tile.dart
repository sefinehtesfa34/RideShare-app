import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feeds/profile/presentation/widgets/rides_history.dart';

class HistoryListTile extends StatelessWidget {
  const HistoryListTile({super.key, required this.historyItem});
  final Map<String, String> historyItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.0.sp, right: 16.sp),
      child: Column(
        children: <Widget>[
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.zero,
              ),
            ),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/current_mocation_marker.svg',
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    SvgPicture.asset(
                      'assets/images/Subtract.svg',
                    ),
                  ],
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RidesHistory(text: historyItem['SourceIcon'] ?? ''),
                      SizedBox(height: 1.h),
                      RidesHistory(text: historyItem['DestinationIcon'] ?? ''),
                    ],
                  ),
                ),
                SizedBox(width: 2.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    RidesHistory(text: historyItem['DateTime'] ?? ''),
                    RidesHistory(text: historyItem['Price'] ?? ''),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

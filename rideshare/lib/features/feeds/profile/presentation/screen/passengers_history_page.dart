import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/special_appbar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final List<Map<String, String>> historyList = [
    {
      'SourceIcon': '4 Kilo Abrehot Library',
      'DestinationIcon': 'Megenagna Metebaber BLDG',
      'DateTime': '5th June 2023 12:28 AM',
      'Price': 'Br 60',
    },
    {
      'SourceIcon': '4 Kilo Abrehot Library',
      'DestinationIcon': 'Megenagna Metebaber BLDG',
      'DateTime': '5th June 2023 12:28 AM',
      'Price': 'Br 60',
    },
    {
      'SourceIcon': '4 Kilo Abrehot Library',
      'DestinationIcon': 'Megenagna Metebaber BLDG',
      'DateTime': '5th June 2023 12:28 AM',
      'Price': 'Br 60',
    },
    {
      'SourceIcon': '4 Kilo Abrehot Library',
      'DestinationIcon': 'Megenagna Metebaber BLDG',
      'DateTime': '5th June 2023 12:28 AM',
      'Price': 'Br 60',
    },
    // Add more history items as needed
  ];

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
                                    Text(
                                      historyItem['SourceIcon'] ?? '',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      historyItem['DestinationIcon'] ?? '',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    historyItem['DateTime'] ?? '',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xFFA0A0A0),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  Text(
                                    historyItem['Price'] ?? '',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: const Color(0xFF1E1E1E),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

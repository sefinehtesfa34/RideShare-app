import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feeds/location/presentation/widgets/text_field.dart';

class LocationPickerPage extends StatelessWidget {
  const LocationPickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Google Map
  
              Container(
                height: 45.0.h,
                color: Colors.grey[300],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SvgPicture.asset('images/current_mocation_marker.svg'),
                  SizedBox(width: 3.w),
                  const Expanded(
                    child: LocationTextField(
                      hintText: 'Enter source location',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.0.h),
              Row(
                children: [
                  SvgPicture.asset('images/Subtract.svg'),
                  SizedBox(width: 3.w),
                  const Expanded(
                    child: LocationTextField(
                      hintText: 'Enter destination location',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.0.h),
              Container(
                width: 339.sp,
                height: 30.sp,
                margin: EdgeInsets.only(left: 2.sp, right: 2.sp, top: 3.sp),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF6D61F2)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Select',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

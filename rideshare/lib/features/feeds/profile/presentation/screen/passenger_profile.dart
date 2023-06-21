import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feeds/profile/presentation/widgets/custom_scaffold_messenger.dart';

import '../../../location/presentation/widgets/select_button.dart';
import '../bloc/update_profile_bloc.dart';
import '../bloc/update_profile_state.dart';
import '../widgets/form_field.dart';
import '../widgets/phone_number_field.dart';
import '../widgets/upload_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String phoneNumber = '923789078';
  final String code = '+251';
  String _fullNameChanged = 'Sergio Ramasis';
  int _ageChanged = 30;

  _getFullNameChange(String value) => _fullNameChanged = value;
  _getAgeChanged(String value) => _ageChanged = int.parse(value);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
      listener: (BuildContext context, UpdateProfileState state) {},
      builder: (BuildContext context, UpdateProfileState state) {
        if (state.isLoading) {
          return const CircularProgressIndicator();
        }
        if (state.isFailed) {
          return const Scaffold(
            body: CustomScaffoldMessenger(),
          );
        }
        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 2.0.h,
                ),
                const UploadImage(),
                SizedBox(height: 2.0.h),
                Text(
                  _fullNameChanged,
                  style: TextStyle(
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF18172B),
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 2.0.h),
                PassengerFormField(
                  onChanged: _getFullNameChange,
                  hintText: 'Full name',
                  label: 'Full name',
                ),
                SizedBox(height: 2.0.h),
                PassengerFormField(
                  onChanged: _getAgeChanged,
                  hintText: _ageChanged.toString(),
                  label: 'Age',
                ),
                SizedBox(height: 2.0.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 1.0.h),
                    PhoneNumberField(code: code, phoneNumber: phoneNumber),
                  ],
                ),
                SizedBox(height: 10.0.h),
                Center(
                  child: SelectButton(
                    onPressed: () {
                      context.read<UpdateProfileBloc>().add(SaveChangesEvent(
                            age: _ageChanged,
                            fullName: _fullNameChanged,
                          ));
                    },
                    buttonName: 'Save',
                    leftPadding: 0.sp,
                    radius: 18.sp,
                    child: const Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text('Save'),
                        ),
                        Positioned(
                          right: 0,
                          child: Image(
                              image: AssetImage('assets/images/arrow.png')),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

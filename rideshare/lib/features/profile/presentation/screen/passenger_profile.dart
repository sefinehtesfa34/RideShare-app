import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../authentication/presentation/widgets/form_field.dart';
import '../../../authentication/presentation/widgets/phone_number_field.dart';
import '../../../authentication/presentation/widgets/redirecting.dart';
import '../../../authentication/presentation/widgets/select_button.dart';
import '../../../authentication/presentation/widgets/upload_image.dart';
import '../bloc/fetch_passenger/bloc/fetch_passenger_bloc.dart';
import '../bloc/update_passenger/update_profile_bloc.dart';
import '../bloc/update_passenger/update_profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String phoneNumber = '923789078';
  final String code = '+251';
  String _fullNameChanged = 'Sergio Ramasis';
  int _ageChanged = 30;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool _isSavedAlertShown = false; // Flag variable

  _getFullNameChange(String value) =>
      {_fullNameChanged = value, _isSavedAlertShown = false};
  _getAgeChanged(String value) =>
      {_ageChanged = int.parse(value), _isSavedAlertShown = false};

  void _showSavedAlert() {
    _isSavedAlertShown = true;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Saved!'),
          content: const Text('Your changes have been saved successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<FetchPassengerBloc>().add(GetPassengerEvent());
    return BlocConsumer<FetchPassengerBloc, FetchPassengerState>(
      listener: (BuildContext context, FetchPassengerState state) {
        if (state is FetchPassengerSuccessState) {
          fullNameController.text = state.fullName;
          ageController.text = state.age.toString();
          phoneNumberController.text = state.phoneNumber.substring(4);
          phoneNumber = phoneNumberController.text;
          _ageChanged = state.age;
          _fullNameChanged = state.fullName;
        }
      },
      builder: (BuildContext context, FetchPassengerState state) {
        if (state is FetchPassengerLoadingState) {
          return const Scaffold(body: Redirecting());
        }
        return BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
          listener: (BuildContext context, UpdateProfileState state) async {
            if (state.isFailed) {
              context.go('/singUp');
            }
            if (state.isSuccess && !_isSavedAlertShown) {
              await Future<dynamic>.delayed(const Duration(seconds: 2));
              _showSavedAlert();
            }
          },
          builder: (BuildContext context, UpdateProfileState state) {
            if (state.isLoading) {
              return const Scaffold(body: Redirecting());
            }

            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16.0.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 2.0.h),
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
                        controller: fullNameController,
                        onChanged: _getFullNameChange,
                        hintText: 'Enter your full name',
                        label: 'Full name',
                      ),
                      SizedBox(height: 2.0.h),
                      PassengerFormField(
                        controller: ageController,
                        onChanged: _getAgeChanged,
                        hintText: "Enter your age",
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
                          PhoneNumberField(
                            code: phoneNumber.substring(0, 4),
                            controller: phoneNumberController,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0.h),
                      Center(
                        child: SelectButton(
                          onPressed: () {
                            context
                                .read<UpdateProfileBloc>()
                                .add(SaveChangesEvent(
                                  age: _ageChanged,
                                  fullName: _fullNameChanged,
                                ));
                            fullNameController.text = _fullNameChanged;
                          },
                          buttonName: 'Save',
                          leftPadding: 0.sp,
                          radius: 18.sp,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                              const Positioned(
                                right: 0,
                                child: Image(
                                  image: AssetImage('assets/images/arrow.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

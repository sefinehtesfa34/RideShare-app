import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/constants/commuter.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/bloc/signup_event.dart';
import 'package:rideshare/features/authentication/presentation/widgets/redirecting.dart';
import '../bloc/signup/bloc/signup_bloc.dart';
import '../bloc/signup/bloc/signup_state.dart';
import '../widgets/form_field.dart';
import '../widgets/select_button.dart';
import '../widgets/upload_image.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _fullNameChanged = 'Sergio Ramasis';
  int _ageChanged = 30;
  _getFullNameChange(String value) => _fullNameChanged = value;
  _getAgeChanged(String value) => _ageChanged = int.parse(value);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignupState>(
      listener: (BuildContext context, SignupState state) {
        if (state is SuccessState) {
          context.go('/login');
        }
      },
      builder: (BuildContext context, SignupState state) {
        if (state is LoadingState) {
          return const Scaffold(body: Redirecting());
        }

        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign UP",
                  style: TextStyle(
                      color: const Color(0xFF6D61F2),
                      fontFamily: 'Poppins',
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Create account",
                  style: TextStyle(
                      color: const Color(0xFF6E80B0),
                      fontFamily: 'Poppins',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                const UploadImage(),
                SizedBox(height: 2.0.h),
                Text(
                  'Insert Image',
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF18172B),
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 2.0.h),
                PassengerFormField(
                  onChanged: _getFullNameChange,
                  controller: fullNameController,
                  hintText: 'Enter your full name',
                  label: 'Full name',
                ),
                SizedBox(height: 2.0.h),
                PassengerFormField(
                  onChanged: _getAgeChanged,
                  controller: ageController,
                  hintText: "Enter your age",
                  label: 'Age',
                ),
                SizedBox(height: 10.0.h),
                Center(
                  child: SelectButton(
                    onPressed: () {
                      context.read<SignUpBloc>().add(SubmitSignupEvent(
                            age: _ageChanged,
                            name: name,
                            commuterId: commuterId,
                            fullName: _fullNameChanged,

                          ));
                    },
                    buttonName: 'Submit',
                    leftPadding: 0.sp,
                    radius: 18.sp,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 18.sp),
                          ),
                        ),
                        const Positioned(
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

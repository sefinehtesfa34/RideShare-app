import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';


import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/signup_payload.dart';
import '../../../domain/usecases/signup.dart';
import '../../../domain/entities/user_profile.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final Signup signup;
  SignUpBloc({required this.signup}) : super(SignUpInitial()) {
    on<SignUpEvent>(_signUp);
  }

  void _signUp(SignUpEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    final  result = await signup(
      SignupPayload(
        fullName: event.fullName,
        age: event.age,
        idImage: event.idImage,
        address: event.address,
        driverLicenseNumber: event.driverLicenseNumber,
        licenseImage: event.licenseImage,
        experienceYear: event.experienceYear,
      ),
    );
    emit(_signupSuccessOrFailure(result));
  }

  SignUpState _signupSuccessOrFailure(Either<Failure, UserProfile> data) {
    return data.fold(
      (Failure failure) => SignUpFailed("Internal server failure"),
      (UserProfile success) => SignUpSuccess(success),
    );
  }
}

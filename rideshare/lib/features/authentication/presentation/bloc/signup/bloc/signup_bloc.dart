import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/authentication/domain/usecases/signup.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/bloc/signup_event.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/bloc/signup_state.dart';

import '../../../../domain/entities/signup_payload.dart';

class SignUpBloc extends Bloc<SignupEvent, SignupState> {
  final Signup signup;
  SignUpBloc({required this.signup}) : super(const SignupState()) {
    on<SubmitSignupEvent>(
        (SubmitSignupEvent event, Emitter<SignupState> emit) async {
      final SignupState signupState = state.copyWith(
        fullName: event.fullName,
        age: event.age,
        phoneNumber: event.phoneNumber,
      );
      print(signupState.phoneNumber);
      print(signupState.fullName);
      print(signupState.age);
      try {
        final Either<Failure, SignupPayload> response =
            await signup.call(SignupPayload(
          age: signupState.age,
          fullName: signupState.fullName,
          imageUrl: signupState.imageUrl,
        ));
        emit(state.copyWith(isLoading: true));
        await Future<dynamic>.delayed(const Duration(seconds: 2));
        if (response.isRight()) {
          emit(state.copyWith(isSuccess: true, isLoading: false));
        } else {
          emit(state.copyWith(isFailure: true, isLoading: false));
        }
      } catch (e) {
        emit(state.copyWith(isFailure: true, isLoading: false));
      }
    });
  }
}

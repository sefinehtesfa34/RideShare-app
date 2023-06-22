import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rideshare/features/authentication/domain/entities/signup_payload.dart';
import 'package:rideshare/features/authentication/domain/usecases/signup.dart';

import '../../../../../core/errors/failures.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final Signup signup;
  SignUpBloc({required this.signup}) : super(SignUpInitial()) {
    on<SignUpEvent>(_signUp);
  }

  void _signUp(SignUpEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    final result = await signup(
      SignupPayload(
        fullName: event.fullName,
        age: event.age,
        idImage: event.idImage,
      ),
    );
    emit(_signupSuccessOrFailure(result));
  }

  SignUpState _signupSuccessOrFailure(Either<Failure, SignupPayload> data) {
    return data.fold(
      (Failure failure) => SignUpFailed(),
      (SignupPayload success) => SignUpSuccess(),
    );
  }
}
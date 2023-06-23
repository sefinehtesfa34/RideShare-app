import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/bloc/signup_event.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/bloc/signup_state.dart';
import '../../../../domain/usecases/signup.dart';

class SignUpBloc extends Bloc<SignupEvent, SignupState> {
  final Signup signup;
  SignUpBloc({required this.signup}) : super(const SignupState()) {
    on<SubmitSignupEvent>(
        (SubmitSignupEvent event, Emitter<SignupState> emit) async {
      emit(state.copyWith(isLoading: true));
      await Future<dynamic>.delayed(const Duration(seconds: 2));

      // final SignupState signupState = state.copyWith(
      //   fullName: event.fullName,
      //   age: event.age,
      //   phoneNumber: event.phoneNumber,
      // );

      // try {
      //   final Either<Failure, SignupPayload> response =
      //       await signup.call(SignupPayload(
      //     age: signupState.age,
      //     fullName: signupState.fullName,
      //     imageUrl: signupState.imageUrl,
      //   ));

      //   if (response.isRight()) {
      //     emit(state.copyWith(isSuccess: true, isLoading: false));
      //   } else {
      //     emit(state.copyWith(isFailure: true, isLoading: false));
      //     print('Failure statement');
      //   }
      // } catch (e) {
      //   emit(state.copyWith(isFailure: true, isLoading: false));
      //   print('Server Failure');
      // }
      emit(state.copyWith(isLoading:false, isSuccess: true));
    });
  }
}

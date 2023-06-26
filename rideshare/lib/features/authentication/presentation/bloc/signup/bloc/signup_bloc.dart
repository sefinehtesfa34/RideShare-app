import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/bloc/signup_event.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/bloc/signup_state.dart';
import '../../../../domain/usecases/signup.dart';

class SignUpBloc extends Bloc<SignupEvent, SignupState> {
  final Signup signup;
  SignUpBloc({required this.signup}) : super(InitialState()) {
    on<SubmitSignupEvent>(
      (SubmitSignupEvent event, Emitter<SignupState> emit) async {
        emit(LoadingState());
        await Future<dynamic>.delayed(const Duration(seconds: 2));
        emit(SuccessState());
      },
    );
  }
}

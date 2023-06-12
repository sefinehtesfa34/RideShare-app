import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/features/authentication/domain/usecases/signup.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/login_payload.dart';
import '../../domain/entities/signup_payload.dart';
import '../../domain/usecases/login.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final Login loginUsecase;
  final Signup signupUsecase;

  AuthBloc(this.loginUsecase, this.signupUsecase) : super(AuthBlocInitial()) {
    on<LoginEvent>(_onAuthLoginEvent);
    on<SignupEvent>(_onAuthSignupEvent);
  }

  void _onAuthLoginEvent(LoginEvent event, Emitter<AuthBlocState> emit) async {
    emit(AuthBlocLoading());

    final failureOrAuthCredentials = await loginUsecase(
        event.authCredentials);

    emit(_loginOrFailure(failureOrAuthCredentials));
  }

  _loginOrFailure(both) {
    return both.fold(
      (failure) => ServerFailure("something"),
      (authCredential) =>
          AuthBlocLoginSuccess(authentication:authCredential ),
    );
  }



  void _onAuthSignupEvent(SignupEvent event, Emitter<AuthBlocState> emit) async {
    emit(AuthBlocLoading());

    final failureOrAuthCredentials = await signupUsecase(
         event.newAuthCredentials);

    emit(_signuporFailure(failureOrAuthCredentials));
  }

  _signuporFailure(both) {
    return both.fold(
      (failure) => ServerFailure("something"),
      (newAuthCredential) =>
          AuthBlocLoginSuccess(authentication: newAuthCredential),
    );
  }

}

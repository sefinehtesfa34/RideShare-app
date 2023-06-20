import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/login_payload.dart';
import '../../domain/usecases/login.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final Login loginUsecase;

  AuthBloc({required this.loginUsecase}) : super(AuthBlocInitial()) {
    on<LoginEvent>(_onAuthLoginEvent);
  }

  void _onAuthLoginEvent(LoginEvent event, Emitter emit) async {
    emit(AuthBlocLoading());

    final failureOrAuthCredentials =
        await loginUsecase(LoginPayloadParams(phoneNumber: event.phoneNumber));

    emit(_loginOrFailure(failureOrAuthCredentials));
  }

  _loginOrFailure(both) {
    return both.fold(
      (failure) => ServerFailure(),
      (authCredential) => AuthBlocLoginSuccess(phoneNumber: authCredential),
    );
  }

  // void _onAuthSignupEvent(SignupEvent event, Emitter<AuthBlocState> emit) async {
  //   emit(AuthBlocLoading());

  //   final failureOrAuthCredentials = await signupUsecase(
  //        event.newAuthCredentials);

  //   emit(_signuporFailure(failureOrAuthCredentials));
  // }

  // _signuporFailure(both) {
  //   return both.fold(
  //     (failure) => ServerFailure("something"),
  //     (newAuthCredential) =>
  //         AuthBlocLoginSuccess(authentication: newAuthCredential),
  //   );
  // }
}

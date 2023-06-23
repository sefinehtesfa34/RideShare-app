import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/login.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login loginUsecase;

  LoginBloc({required this.loginUsecase}) : super(LoginInitialState()) {
    on<SubmitEvent>(_onAuthLoginEvent);
  }

  void _onAuthLoginEvent(SubmitEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());

    await Future<dynamic>.delayed(const Duration(seconds: 2));
    try {
      final response = await loginUsecase.call(event.phoneNumber);
      print(response);
      emit(LoginLoginSuccessState());
    } catch (e) {
      emit(LoginFailureState());
    }
    emit(LoginFailureState());
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/features/profile/domain/entity/passenger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../domain/usecases/login.dart';
import '../../firebase/bloc/firebase_bloc.dart';
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
      await loginUsecase.call(event.phoneNumber);

      emit(LoginLoginSuccessState());
    } catch (e) {
      emit(LoginFailureState());
    }
    emit(LoginFailureState());
  }
}

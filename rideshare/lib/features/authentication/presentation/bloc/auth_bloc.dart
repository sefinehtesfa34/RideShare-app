import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final Login loginUsecase;

  AuthBloc({required this.loginUsecase}) : super(AuthBlocInitial()) {
    on<LoginEvent>(_onAuthLoginEvent);
  }

  void _onAuthLoginEvent(LoginEvent event, Emitter<AuthBlocState> emit) async {
    emit(AuthBlocLoading());
    final authCredentials =
        await loginUsecase(LoginPayloadParams(phoneNumber: event.phoneNumber));

    emit(AuthBlocLoginSuccess(phoneNumber: authCredentials.toString()));
  }
}

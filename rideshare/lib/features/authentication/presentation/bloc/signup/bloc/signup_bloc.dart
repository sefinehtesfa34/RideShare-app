import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/features/authentication/domain/entities/signup_payload.dart';
import 'package:rideshare/features/authentication/presentation/bloc/firebase/bloc/firebase_bloc.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/bloc/signup_event.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/bloc/signup_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../domain/usecases/signup.dart';

class SignUpBloc extends Bloc<SignupEvent, SignupState> {
  final Signup signup;
  SignUpBloc({required this.signup}) : super(InitialState()) {
    on<SubmitSignupEvent>(
      (SubmitSignupEvent event, Emitter<SignupState> emit) async {
        emit(LoadingState());
        try {
          SharedPreferences sharedPreferences =
              await cacheManager.sharedPreferences;
              
          await signup.call(SignupPayload(
              id: event.commuterId,
              name: event.name,
              fullName: event.fullName,
              age: event.age,
              phoneNumber:
                  sharedPreferences.getString('PHONE_NUMBER') ?? '+251'));
        } catch (e) {
          print('Please provide a valid data');
        }
        await Future<dynamic>.delayed(const Duration(seconds: 2));
        emit(SuccessState());
      },
    );
  }
}

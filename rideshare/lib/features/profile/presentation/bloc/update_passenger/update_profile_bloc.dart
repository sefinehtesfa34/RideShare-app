import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/features/profile/presentation/bloc/update_passenger/update_profile_state.dart';

import '../../../domain/usecase/passenger_usecase.dart';

part 'update_profile_event.dart';

class UpdateProfileBloc extends Bloc<ProfileUpdateEvent, UpdateProfileState> {
  final UpdatePassengerProfileUsecase usecase;
  UpdateProfileBloc({required this.usecase})
      : super(const UpdateProfileState()) {
    on<UpdateFullNameEvent>(
        (UpdateFullNameEvent event, Emitter<UpdateProfileState> emit) {
      emit(state.copyWith(fullName: event.fullName));
    });
    on<UpdateAgeEvent>(
        (UpdateAgeEvent event, Emitter<UpdateProfileState> emit) {
      emit(state.copyWith(age: event.age));
    });
    on<UpdatePhotoEvent>(
        (UpdatePhotoEvent event, Emitter<UpdateProfileState> emit) {
      emit(state.copyWith(imageUrl: event.imagePath));
    });

    on<SaveChangesEvent>(
        (SaveChangesEvent event, Emitter<UpdateProfileState> emit) async {
      emit(state.copyWith(
        isLoading: true,
        age: event.age,
        fullName: event.fullName,
      ));
      await Future<dynamic>.delayed(const Duration(seconds: 3));
      emit(state.copyWith(isSuccess: true, isLoading: false));
      //Send to backend
    });
  }
}

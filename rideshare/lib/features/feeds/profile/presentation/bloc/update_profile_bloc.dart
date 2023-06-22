import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/features/feeds/profile/domain/usecase/passenger_usecase.dart';
import 'package:rideshare/features/feeds/profile/presentation/bloc/update_profile_state.dart';

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
      // final UpdateProfileState updateProfileState = state.copyWith();
      //Some calls here
      emit(state.copyWith(
        isLoading: true,
        age: event.age,
        fullName: event.fullName,
      ));
      await Future<dynamic>.delayed(const Duration(seconds: 3));
      emit(state.copyWith(isFailed: true, isLoading: false));
    });
  }
}

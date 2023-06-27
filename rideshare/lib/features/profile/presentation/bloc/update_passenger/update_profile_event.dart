part of 'update_profile_bloc.dart';

abstract class ProfileUpdateEvent extends Equatable {
  const ProfileUpdateEvent();

  @override
  List<Object> get props => [];
}

class UpdateFullNameEvent extends ProfileUpdateEvent {
  final String fullName;

  const UpdateFullNameEvent({required this.fullName});
}

class UpdateAgeEvent extends ProfileUpdateEvent {
  final int age;

  const UpdateAgeEvent({required this.age});
}

class UpdatePhotoEvent extends ProfileUpdateEvent {
  final String imagePath;

  const UpdatePhotoEvent({required this.imagePath});
}

class SaveChangesEvent extends ProfileUpdateEvent {
  final String? fullName;
  final int? age;
  const SaveChangesEvent({this.age, this.fullName});
}
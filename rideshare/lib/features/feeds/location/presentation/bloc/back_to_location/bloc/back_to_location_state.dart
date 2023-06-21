part of 'back_to_location_bloc.dart';

@immutable
abstract class BackToLocationState {}

class BackToLocationInitial extends BackToLocationState {}

class BackToLocationLoading extends BackToLocationState {}

class BackToLocationSuccess extends BackToLocationState {
  final LatLng currentLocation;

  BackToLocationSuccess(this.currentLocation);
}

class BackToLocationFailure extends BackToLocationState {}

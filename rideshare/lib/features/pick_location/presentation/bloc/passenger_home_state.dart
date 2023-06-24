part of 'passenger_home_bloc.dart';

abstract class SlidingContainerState {}

class SearchDriverContainerVisibleState extends SlidingContainerState {}

class SearchDriverContainerHiddenState extends SlidingContainerState {}

abstract class NamesState {}

class NamesInitial extends NamesState {}

class NamesLoading extends NamesState {}

class NamesLoaded extends NamesState {
  final List<Destination> names;

  NamesLoaded(this.names);
}

class NamesError extends NamesState {
  final String errorMessage;

  NamesError(
    this.errorMessage,
  );
}

abstract class ChooseLocationsState {}

class ChooseLocationsInitial extends ChooseLocationsState {}

class ChooseLocationsLoading extends ChooseLocationsState {}

class ChooseLocationsSucess extends ChooseLocationsState {
  final LatLng soureLocation;
  final LatLng destinationLocation;
  final String sourceName;
  final String destinationName;

  ChooseLocationsSucess(
    this.soureLocation,
    this.destinationLocation,
    this.sourceName,
    this.destinationName,
  );
}

class ChooseLocationsError extends ChooseLocationsState {}

abstract class CurrentLocationState {}

class CurrentLocationInitial extends CurrentLocationState {}

class CurrentLocationLoading extends CurrentLocationState {}

class CurrentLocationSuccess extends CurrentLocationState {
  final LatLng location;

  CurrentLocationSuccess(this.location);
}

class CurrentLocationError extends CurrentLocationState {}

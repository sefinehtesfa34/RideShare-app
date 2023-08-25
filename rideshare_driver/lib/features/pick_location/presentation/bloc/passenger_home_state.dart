part of 'passenger_home_bloc.dart';

abstract class SlidingContainerState {}

class SearchDriverContainerVisibleState extends SlidingContainerState {}

class SearchDriverContainerHiddenState extends SlidingContainerState {}

abstract class NamesState extends Equatable {}

class NamesInitial extends NamesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NamesLoading extends NamesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NamesLoaded extends NamesState {
  final List<Destination> names;

  NamesLoaded(this.names);

  @override
  // TODO: implement props
  List<Object?> get props => [names];
}

class NamesError extends NamesState {
  final String errorMessage;

  NamesError(
    this.errorMessage,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

abstract class ChooseLocationsState extends Equatable {}

class ChooseLocationsInitial extends ChooseLocationsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChooseLocationsLoading extends ChooseLocationsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

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

  @override
  // TODO: implement props
  List<Object?> get props =>
      [soureLocation, destinationLocation, sourceName, destinationName];
}

class ChooseLocationsError extends ChooseLocationsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

abstract class CurrentLocationState extends Equatable {}

class CurrentLocationInitial extends CurrentLocationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CurrentLocationLoading extends CurrentLocationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CurrentLocationSuccess extends CurrentLocationState {
  final LatLng location;

  CurrentLocationSuccess(this.location);

  @override
  // TODO: implement props
  List<Object?> get props => [location];
}

class CurrentLocationError extends CurrentLocationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

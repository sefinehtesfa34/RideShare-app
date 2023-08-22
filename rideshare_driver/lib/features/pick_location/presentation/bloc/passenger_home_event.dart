part of 'passenger_home_bloc.dart';

abstract class SlidingContainerEvent {}

class CancelEvent extends SlidingContainerEvent {}

class ConfirmEvent extends SlidingContainerEvent {}

abstract class NamesEvent {}

class FetchNamesEvent extends NamesEvent {}

abstract class ChooseLocationsEvent extends Equatable {}

class SelectecLocationsEvent extends ChooseLocationsEvent {
  final String sourceLocation;
  final String destinationLocation;
  final LatLng? sourceCoordinates;
  final LatLng? destinationCoordinates;

  SelectecLocationsEvent(
    this.sourceLocation,
    this.destinationLocation,
    this.sourceCoordinates,
    this.destinationCoordinates,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
        sourceLocation,
        destinationLocation,
        sourceCoordinates,
        destinationCoordinates
      ];
}

class SelectecLocationFromList extends ChooseLocationsEvent {
  final double destinationLatitude;
  final double destinationLongitude;
  final String destinationName;
  final double sourceLatitude;
  final double sourcelongitude;
  SelectecLocationFromList(
    this.destinationLatitude,
    this.destinationLongitude,
    this.destinationName,
    this.sourceLatitude,
    this.sourcelongitude,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
        destinationLatitude,
        destinationLongitude,
        destinationName,
        sourceLatitude,
        sourcelongitude
      ];
}

abstract class CurrentLocationEvent extends Equatable {}

class FetchCurrentLocationEvent extends CurrentLocationEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

part of 'passenger_home_bloc.dart';

abstract class SlidingContainerEvent {}

class CancelEvent extends SlidingContainerEvent {}

class ConfirmEvent extends SlidingContainerEvent {}

abstract class NamesEvent {}

class FetchNamesEvent extends NamesEvent {}

abstract class ChooseLocationsEvent {}

class SelectecLocationsEvent extends ChooseLocationsEvent {
  final String sourceLocation;
  final String destinationLocation;

  SelectecLocationsEvent(
    this.sourceLocation,
    this.destinationLocation,
  );
}

class SelectecLocationFromList extends ChooseLocationsEvent {
  final double destinationLatitude;
  final double destinationLongitude;
  final String sourceName;

  SelectecLocationFromList(
    this.destinationLatitude,
    this.destinationLongitude,
    this.sourceName,
  );
}

abstract class CurrentLocationEvent {}

class FetchCurrentLocationEvent extends CurrentLocationEvent {}

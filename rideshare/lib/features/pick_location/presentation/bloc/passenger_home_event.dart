part of 'passenger_home_bloc.dart';

/// This Abstract class serves as the base class for events related to the sliding container functionality.
abstract class SlidingContainerEvent {}

/// An event that triggers the cancellation of an action related to the sliding container.
class CancelEvent extends SlidingContainerEvent {}

/// An event that triggers the confirmation of an action related to the sliding container.
class ConfirmEvent extends SlidingContainerEvent {}

/// This Abstract class serves as the base class for events related to passenger names retrieval.
abstract class NamesEvent {}

/// An event that triggers the fetching of passenger names.
class FetchNamesEvent extends NamesEvent {}

/// This Abstract class serves as the base class for events related to choosing source and destination locations.
abstract class ChooseLocationsEvent {}

/// An event that indicates the selection of source and destination locations.
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
}

/// Selected Location From List Event
///
/// An event that indicates the selection of source and destination locations from a list.
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
}

/// This Abstract class serves as the base class for events related to retrieving the current device location.
abstract class CurrentLocationEvent {}

/// An event that triggers the fetching of the current device location.
class FetchCurrentLocationEvent extends CurrentLocationEvent {}

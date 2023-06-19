part of 'location_bloc.dart';

abstract class LocationEvent {}

class SourceLocationChangedEvent extends LocationEvent {
  final double sourceLatitude;
  final double sourceLongitude;

  SourceLocationChangedEvent({
    required this.sourceLatitude,
    required this.sourceLongitude,
  });
}

class DestinationLocationChangedEvent extends LocationEvent {
  final double destinationLatitude;
  final double destinationLongitude;

  DestinationLocationChangedEvent({
    required this.destinationLatitude,
    required this.destinationLongitude,
  });
}

class SelectLocationEvent extends LocationEvent {
  final double sourceLatitude;
  final double sourceLongitude;
  final double destinationLatitude;
  final double destinationLongitude;
  SelectLocationEvent({
    required this.sourceLatitude,
    required this.destinationLatitude,
    required this.destinationLongitude,
    required this.sourceLongitude,
  });
}

class SubmitLocationEvent extends LocationEvent {}

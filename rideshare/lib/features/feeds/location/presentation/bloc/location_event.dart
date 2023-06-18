part of 'location_bloc.dart';

abstract class LocationEvent {}

class SourceLocationChangedEvent extends LocationEvent {
  final String source;

  SourceLocationChangedEvent({required this.source});
}

class DestinationLocationChangedEvent extends LocationEvent {
  final String destination;

  DestinationLocationChangedEvent({required this.destination});
}

class SelectLocationEvent extends LocationEvent {
  final String source;
  final String destination;
  SelectLocationEvent({required this.source, required this.destination});
}

class SubmitLocationEvent extends LocationEvent {}

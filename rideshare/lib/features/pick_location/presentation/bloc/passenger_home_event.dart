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

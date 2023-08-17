part of 'passenger_home_bloc.dart';

/// This abstract class defines the base structure for various states
/// related to the sliding container functionality.
abstract class SlidingContainerState {}

/// A state indicating that the search driver container is visible.
class SearchDriverContainerVisibleState extends SlidingContainerState {}

/// A state indicating that the search driver container is hidden.
class SearchDriverContainerHiddenState extends SlidingContainerState {}

/// This abstract class defines the base structure for different states
/// related to passenger names retrieval.
abstract class NamesState {}

/// Initial state indicating that passenger names retrieval has not started.
class NamesInitial extends NamesState {}

/// State indicating that passenger names retrieval is in progress.
class NamesLoading extends NamesState {}

/// State indicating that passenger names retrieval has successfully completed.
class NamesLoaded extends NamesState {
  final List<Destination> names;

  NamesLoaded(this.names);
}

/// State indicating that an error occurred during passenger names retrieval.
class NamesError extends NamesState {
  final String errorMessage;

  NamesError(this.errorMessage);
}

/// This abstract class defines the base structure for states
/// related to choosing source and destination locations.
abstract class ChooseLocationsState {}

/// Initial state indicating that the source and destination location selection process has not started.
class ChooseLocationsInitial extends ChooseLocationsState {}

/// State indicating that the source and destination location selection is in progress.
class ChooseLocationsLoading extends ChooseLocationsState {}

/// State indicating that the source and destination location selection was successful.
class ChooseLocationsSucess extends ChooseLocationsState {
  final LatLng sourceLocation;
  final LatLng destinationLocation;
  final String sourceName;
  final String destinationName;

  ChooseLocationsSucess(
    this.sourceLocation,
    this.destinationLocation,
    this.sourceName,
    this.destinationName,
  );
}

/// State indicating that an error occurred during the source and destination location selection process.
class ChooseLocationsError extends ChooseLocationsState {}

/// This abstract class defines the base structure for states
/// related to retrieving the current device location.
abstract class CurrentLocationState {}

/// Initial state indicating that the fetching of the current device location has not started.
class CurrentLocationInitial extends CurrentLocationState {}

/// State indicating that the fetching of the current device location is in progress.
class CurrentLocationLoading extends CurrentLocationState {}

/// State indicating that the current device location retrieval was successful.
class CurrentLocationSuccess extends CurrentLocationState {
  final LatLng location;

  CurrentLocationSuccess(this.location);
}

/// State indicating that an error occurred during the current device location retrieval.
class CurrentLocationError extends CurrentLocationState {}

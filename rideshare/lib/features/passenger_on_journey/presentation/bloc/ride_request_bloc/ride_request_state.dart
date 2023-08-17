part of 'ride_request_bloc.dart';

/// Represents an abstract base class for states related to ride requests.
@immutable
abstract class RideRequestState {}

/// Represents the initial state of the ride request.
class RideRequestInitial extends RideRequestState {}

/// Represents a state where the ride request has been successfully retrieved.
/// It includes a [stream] of [RideRequest] objects.
class RideRequestSuccessState extends RideRequestState {
  /// A stream of ride request data.
  final Stream<RideRequest> stream;

  /// Creates a [RideRequestSuccessState] with the provided [stream] of ride requests.
  RideRequestSuccessState(this.stream);
}

/// Represents a state where the ride request retrieval has failed.
/// It includes an error [message] describing the failure.
class RideRequestFailureState extends RideRequestState {
  /// A message describing the cause of the failure.
  final String message;

  /// Creates a [RideRequestFailureState] with the provided error [message].
  RideRequestFailureState(this.message);
}

/// Represents a state where the application is waiting for a response related to the ride request.
class RideRequestWaitingState extends RideRequestState {}

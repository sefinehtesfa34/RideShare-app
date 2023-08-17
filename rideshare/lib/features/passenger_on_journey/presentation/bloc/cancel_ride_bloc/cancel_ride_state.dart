part of 'cancel_ride_bloc.dart';

/// Represents an abstract base class for states related to the cancellation of ride requests.
@immutable
abstract class CancelRideState {}

/// Represents the initial state of the cancel ride process.
class CancelRideInitial extends CancelRideState {}

/// Represents a state where the cancellation of a ride request has failed.
/// It includes an error [message] describing the failure.
class CancelRideFailed extends CancelRideState {
  /// A message describing the cause of the cancellation failure.
  final String message;

  /// Creates a [CancelRideFailed] state with the provided error [message].
  CancelRideFailed(this.message);
}

/// Represents a state where the cancellation of a ride request was successful.
/// It includes a [status] indicating the success status.
class CancelRideSuccess extends CancelRideState {
  /// The success status of the ride request cancellation.
  final bool status;

  /// Creates a [CancelRideSuccess] state with the provided [status].
  CancelRideSuccess(this.status);
}

/// Represents a state where the application is in the process of canceling a ride request.
class CancelRideLoading extends CancelRideState {}

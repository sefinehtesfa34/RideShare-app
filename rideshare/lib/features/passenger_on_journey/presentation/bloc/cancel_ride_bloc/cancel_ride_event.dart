part of 'cancel_ride_bloc.dart';

/// Represents an abstract base class for events related to canceling ride requests.
@immutable
abstract class CancelRideEvent {}

/// Represents an event triggering the cancellation of a ride request.
/// It includes the [rideRequestId] and [userPhone] associated with the ride request to be canceled.
class CancelRideTrigger extends CancelRideEvent {
  /// The ID of the ride request to be canceled.
  final String rideRequestId;

  /// The phone number of the user initiating the cancellation.
  final String userPhone;

  /// Creates a [CancelRideTrigger] event with the provided [rideRequestId] and [userPhone].
  CancelRideTrigger({required this.rideRequestId, required this.userPhone});
}

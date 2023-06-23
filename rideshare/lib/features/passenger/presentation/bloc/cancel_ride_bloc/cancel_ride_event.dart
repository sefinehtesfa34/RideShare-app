part of 'cancel_ride_bloc.dart';

@immutable
abstract class CancelRideEvent {}

class CancelRideTrigger extends CancelRideEvent {
  final String rideRequestId;
  final String userPhone;

  CancelRideTrigger({required this.rideRequestId, required this.userPhone});
}

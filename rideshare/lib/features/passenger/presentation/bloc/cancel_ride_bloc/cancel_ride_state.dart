part of 'cancel_ride_bloc.dart';

@immutable
abstract class CancelRideState {}

class CancelRideInitial extends CancelRideState {}

class CancelRideFailed extends CancelRideState {
  final String message;

  CancelRideFailed(this.message);
}

class CancelRideSuccess extends CancelRideState {
  final bool status;

  CancelRideSuccess(this.status);
  
}

class CancelRideLoding extends CancelRideState {}

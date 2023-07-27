part of 'ride_request_bloc.dart';

@immutable
abstract class RideRequestState {}

class RideRequestInitial extends RideRequestState {}

class RideRequestSuccessState extends RideRequestState {
  final Stream<RideRequest> stream;
  RideRequestSuccessState(this.stream);
}

class RideRequestFailureState extends RideRequestState {
  final String message;

  RideRequestFailureState(this.message);
}

class RideRequestWaitingState extends RideRequestState {}

part of 'ride_request_bloc.dart';

@immutable
abstract class RideRequestState extends Equatable {}

class RideRequestInitial extends RideRequestState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RideRequestSuccessState extends RideRequestState {
  final Stream<RideRequest> stream;
  RideRequestSuccessState(this.stream);

  @override
  // TODO: implement props
  List<Object?> get props => [stream];
}

class RideRequestFailureState extends RideRequestState {
  final String message;

  RideRequestFailureState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class RideRequestWaitingState extends RideRequestState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

part of 'pick_passengers_bloc.dart';

@immutable
abstract class PickPassengersEvent {}

class PickPassenger extends PickPassengersEvent {
  final RideOffer rideOffer;

  PickPassenger(this.rideOffer);
}


class RemovePassenger extends PickPassengersEvent {
  final RideOffer rideOffer;

  RemovePassenger(this.rideOffer);
}

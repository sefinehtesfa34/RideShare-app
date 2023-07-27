part of 'ride_request_bloc.dart';

@immutable
abstract class RideRequestEvent {}

class RideOfferEvent extends RideRequestEvent {
  final RideOffer passenger;

  RideOfferEvent(this.passenger);
}

class RideOfferCancelEvent extends RideRequestEvent {}

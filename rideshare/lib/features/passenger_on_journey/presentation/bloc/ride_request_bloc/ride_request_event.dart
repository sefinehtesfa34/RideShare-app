part of 'ride_request_bloc.dart';

/// Ride Request Event
///
/// Represents an abstract base class for events related to ride requests.
@immutable
abstract class RideRequestEvent {}

/// Ride Offer Event
///
/// Represents an event where a ride offer is made by a passenger.
/// It includes information about the [passenger] who made the offer.
class RideOfferEvent extends RideRequestEvent {
  /// The ride offer made by the passenger.
  final RideOffer passenger;

  /// Creates a [RideOfferEvent] with the provided [passenger].
  RideOfferEvent(this.passenger);
}

/// Represents an event where a ride offer is canceled by the passenger.
class RideOfferCancelEvent extends RideRequestEvent {}

part of 'fetch_passengers_bloc.dart';

@immutable
abstract class FetchPassengersState {}

class FetchPassengersInitial extends FetchPassengersState {}

class FetchPassengersFailure extends FetchPassengersState {}

class FetchPassengersSuccess extends FetchPassengersState {
  Stream<List<RideOffer>> rideOffers;
  FetchPassengersSuccess(this.rideOffers);
}

class FetchPassengersLoading extends FetchPassengersState{}

part of 'fetch_passengers_bloc.dart';

@immutable
abstract class FetchPassengersEvent {}

class FetchAllPassengers extends FetchPassengersEvent {
  FetchAllPassengers();
}

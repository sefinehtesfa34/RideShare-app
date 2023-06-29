part of 'fetch_passengers_bloc.dart';

@immutable
abstract class FetchPassengersEvent {}

class FetchAllPassengers extends FetchPassengersEvent {
  final RideRequest request;
  FetchAllPassengers({required this.request});
}

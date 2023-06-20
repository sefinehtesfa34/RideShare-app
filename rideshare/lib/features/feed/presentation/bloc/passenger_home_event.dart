part of 'passenger_home_bloc.dart';

abstract class PassengerHomeEvent extends Equatable {
  const PassengerHomeEvent();

  @override
  List<Object> get props => [];
}

class FetchLoadingEvent extends PassengerHomeEvent {
  final String query;
  FetchLoadingEvent(this.query);
}
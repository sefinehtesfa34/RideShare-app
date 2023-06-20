part of 'passenger_home_bloc.dart';

abstract class PassengerHomeState extends Equatable {
  const PassengerHomeState();

  @override
  List<Object> get props => [];
}

class PassengerHomeInitial extends PassengerHomeState {}

class FetchLoadingState extends PassengerHomeState {}

class FetchLoadingSuccessState extends PassengerHomeState {
  final Destination destination;
  FetchLoadingSuccessState(this.destination);
}

class FetchLoadingFailureState extends PassengerHomeState {}


part of 'fetch_passenger_bloc.dart';

abstract class FetchPassengerEvent extends Equatable {
  const FetchPassengerEvent();

  @override
  List<Object> get props => [];
}

class GetPassengerEvent extends FetchPassengerEvent {}

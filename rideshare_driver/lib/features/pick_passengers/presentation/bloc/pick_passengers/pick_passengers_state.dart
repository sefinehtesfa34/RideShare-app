part of 'pick_passengers_bloc.dart';

@immutable
abstract class PickPassengersState {}

class PickPassengersInitial extends PickPassengersState {}

class PickPassengersSuccess extends PickPassengersState {
  final RideOffer addedOffer;

  PickPassengersSuccess(this.addedOffer);
}

class PickPassengersFailure extends PickPassengersState {}

class PickPassengersLoading extends PickPassengersState{}


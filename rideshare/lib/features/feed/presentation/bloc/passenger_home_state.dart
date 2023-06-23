part of 'passenger_home_bloc.dart';

abstract class SlidingContainerState {}

class SearchDriverContainerVisibleState extends SlidingContainerState {}

class SearchDriverContainerHiddenState extends SlidingContainerState {}


abstract class NamesState {}

class NamesInitial extends NamesState {}

class NamesLoading extends NamesState {}
class NamesLoaded extends NamesState {
  final List<Destination> names;

  NamesLoaded(this.names);
}

class NamesError extends NamesState {
  final String errorMessage;

  NamesError(this.errorMessage,);
}


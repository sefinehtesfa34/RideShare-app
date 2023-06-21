part of 'passenger_home_bloc.dart';

abstract class SlidingContainerEvent {}

class CancelEvent extends SlidingContainerEvent {}

class ConfirmEvent extends SlidingContainerEvent {}


abstract class NamesEvent {}

class FetchNamesEvent extends NamesEvent {}


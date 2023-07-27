part of 'sliding_container_bloc.dart';

@immutable
abstract class SlidingContainerEvent {}


class CancelEvent extends SlidingContainerEvent {}

class ConfirmEvent extends SlidingContainerEvent {}

abstract class NamesEvent {}

class FetchNamesEvent extends NamesEvent {}

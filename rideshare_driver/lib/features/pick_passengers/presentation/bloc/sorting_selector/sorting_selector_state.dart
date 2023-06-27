part of 'sorting_selector_bloc.dart';

@immutable
abstract class SortingSelectorState {}

class SortingSelectorInitial extends SortingSelectorState {
  final opitons;

  SortingSelectorInitial([this.opitons = 'price' ]);
}


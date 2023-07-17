part of 'sorting_selector_bloc.dart';

@immutable
abstract class SortingSelectorEvent {}

class SortingSelected extends SortingSelectorEvent {
  final String option;

  SortingSelected(this.option);
  
}

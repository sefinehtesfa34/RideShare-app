import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sorting_selector_event.dart';
part 'sorting_selector_state.dart';

class SortingSelectorBloc
    extends Bloc<SortingSelectorEvent, SortingSelectorState> {
  SortingSelectorBloc() : super(SortingSelectorInitial()) {
    on<SortingSelected>((event, emit) {
      emit(SortingSelectorInitial(event.option));
    });
  }
}

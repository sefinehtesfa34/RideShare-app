import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sliding_container_event.dart';
part 'sliding_container_state.dart';

class SlidingContainerBloc
    extends Bloc<SlidingContainerEvent, SlidingContainerState> {
  SlidingContainerBloc() : super(SearchDriverContainerVisibleState()) {
    on<CancelEvent>(_onCancel);
    on<ConfirmEvent>(_onConfirm);
  }


  void _onCancel(CancelEvent event, Emitter<SlidingContainerState> emit) {
    emit(SearchDriverContainerHiddenState());
  }


  void _onConfirm(ConfirmEvent event, Emitter<SlidingContainerState> emit) {
    if (state is SearchDriverContainerVisibleState) {
      emit(SearchDriverContainerHiddenState());
    } else if (state is SearchDriverContainerHiddenState) {
      emit(SearchDriverContainerVisibleState());
    }
  }
}

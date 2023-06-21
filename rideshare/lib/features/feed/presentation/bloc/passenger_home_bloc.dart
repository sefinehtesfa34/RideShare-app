import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';

import '../../domain/usecases/destination_usecase.dart';
part 'passenger_home_event.dart';
part 'passenger_home_state.dart';

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

class NamesBloc extends Bloc<NamesEvent, NamesState> {
  final FetchPassengerHistoryUseCase fetchPassengerHistoryUseCase;

  NamesBloc({required this.fetchPassengerHistoryUseCase}) : super(NamesInitial());

  @override
  Stream<NamesState> mapEventToState(NamesEvent event) async* {
    if (event is FetchNamesEvent) {
      yield* _mapFetchNamesEventToState();
    }
  }

  Stream<NamesState> _mapFetchNamesEventToState() async* {
    emit(NamesInitial());

    try {
      final response = await http.get(Uri.parse(
          'https://mocki.io/v1/a72e8fae-c302-47ff-bd4f-1d5c7e32df58'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final names = List<String>.from(data['names']);
        emit(NamesLoaded(names));

      } else {
        emit(NamesError('Failed to fetch names'));
      }
      
    } catch (error) {
      emit(NamesError('An error occurred'));
    }
  }
}

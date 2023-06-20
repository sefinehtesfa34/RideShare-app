import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';

import '../../domain/entities/destination.dart';
import '../../domain/usecases/destination_usecase.dart';

part 'passenger_home_event.dart';
part 'passenger_home_state.dart';

class PassengerHomeBloc extends Bloc<PassengerHomeEvent, PassengerHomeState> {
  FetchPassengerHistoryUseCase fetchPassengerHistoryUseCase;
  FetchPopularDestinationsUseCase fetchPopularDestinationsUseCase;

  PassengerHomeBloc(this.fetchPassengerHistoryUseCase, this.fetchPopularDestinationsUseCase) : super(PassengerHomeInitial()) {
    on<FetchLoadingEvent>(_onFetch);
  }

    void _onFetch(FetchLoadingEvent event, Emitter emit) async {
      emit(FetchLoadingState());

      final failureOrDetail = await fetchPassengerHistoryUseCase;

     emit(_detailOrFailure(failureOrDetail));
    }

     _detailOrFailure(both){
    return both.fold(
      (failure) => FetchLoadingFailureState(),
      (detail) => FetchLoadingSuccessState(detail),
    );
  }

}
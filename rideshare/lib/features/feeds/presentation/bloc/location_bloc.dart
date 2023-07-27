import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/features/feeds/domain/usecase/location_usecase.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocationUsecase getUsecase;
  final PostLocationUsecase postLocationUsecase;
  LocationBloc({required this.getUsecase, required this.postLocationUsecase})
      : super(LocationState()) {
    on<SourceLocationChangedEvent>(
        (SourceLocationChangedEvent event, Emitter<LocationState> emit) {
      emit(state.copyWith(
        sourceLatitude: event.sourceLatitude,
        sourceLongitude: event.sourceLongitude,
      ));
    });
    on<DestinationLocationChangedEvent>(
        (DestinationLocationChangedEvent event, Emitter<LocationState> emit) {
      emit(state.copyWith(
        destinationLatitude: event.destinationLatitude,
        destinationLongitude: event.destinationLongitude,
      ));
    });
    on<SelectLocationEvent>(
        (SelectLocationEvent event, Emitter<LocationState> emit) {
      emit(state.copyWith(
        destinationLatitude: event.destinationLatitude,
        destinationLongitude: event.destinationLongitude,
        sourceLatitude: event.sourceLatitude,
        sourceLongitude: event.sourceLongitude,
      ));
    });
    on<SubmitLocationEvent>(
        (SubmitLocationEvent event, Emitter<LocationState> emit) async {
      //Post data usecase
      emit(state.copyWith(isLoading: true));
      Future<dynamic>.delayed(const Duration(seconds: 2));
      //Post to backend
      try {
        final LocationState curState = state.copyWith();
        await postLocationUsecase.call(Params(
          destinationLatitude: curState.destinationLatitude,
          destinationLongitude: curState.destinationLongitude,
          sourceLatitude: curState.sourceLatitude,
          sourceLongitude: curState.sourceLongitude,
        ));
        emit(state.copyWith(isSuccess: true));
      } catch (e) {
        emit(state.copyWith(failed: true));
      }
    });
  }
}

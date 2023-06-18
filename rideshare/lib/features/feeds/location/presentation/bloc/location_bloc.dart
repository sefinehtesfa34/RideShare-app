import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/features/feeds/location/domain/usecase/location_usecase.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationUsecase usecase;
  LocationBloc({
    required this.usecase,
  }) : super(LocationState()) {
    on<SourceLocationChangedEvent>(
        (SourceLocationChangedEvent event, Emitter<LocationState> emit) {
      state.copyWith(source: event.source);
    });
    on<DestinationLocationChangedEvent>(
        (DestinationLocationChangedEvent event, Emitter<LocationState> emit) {
      state.copyWith(destination: event.destination);
    });
    on<SelectLocationEvent>(
        (SelectLocationEvent event, Emitter<LocationState> emit) {
      state.copyWith(source: event.source, destination: event.destination);
    });
    on<SubmitLocationEvent>(
        (SubmitLocationEvent event, Emitter<LocationState> emit) {});
  }
}

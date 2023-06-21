import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';
import 'package:rideshare/core/location/location.dart';

part 'back_to_location_event.dart';
part 'back_to_location_state.dart';

class BackToLocationBloc
    extends Bloc<BackToLocationEvent, BackToLocationState> {
  BackToLocationBloc() : super(BackToLocationInitial()) {
    on<BackToLocationEvent>((event, emit) async {
      emit(BackToLocationLoading());
      Position? position = await getLocationTemp();
      emit(BackToLocationSuccess(
          LatLng(position!.latitude, position.longitude)));
    });
  }
}

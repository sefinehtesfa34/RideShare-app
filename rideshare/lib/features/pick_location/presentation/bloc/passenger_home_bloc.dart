import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rideshare/features/pick_location/domain/entities/destination.dart';

import '../../../../core/errors/failures.dart';
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

  NamesBloc({required this.fetchPassengerHistoryUseCase})
      : super(NamesInitial()) {
    on<NamesEvent>(_onNameFetch);
  }

  void _onNameFetch(NamesEvent event, Emitter<NamesState> emit) async {
    emit(NamesLoading());

    final failureOrList = await fetchPassengerHistoryUseCase();
    emit(_errorOrNamesList(failureOrList));
  }

  NamesState _errorOrNamesList(
      Either<Failure, List<Destination>> failureOrNamesList) {
    return failureOrNamesList.fold(
      (failure) => NamesError("$failure"),
      (names) => NamesLoaded(names),
    );
  }
}

class ChooseLocationsBloc
    extends Bloc<ChooseLocationsEvent, ChooseLocationsState> {
  ChooseLocationsBloc() : super(ChooseLocationsInitial()) {
    on<SelectecLocationsEvent>(_onNameFetch);
    on<SelectecLocationFromList>(_onLocationSelectedFromList);
  }

  void _onNameFetch(
      SelectecLocationsEvent event, Emitter<ChooseLocationsState> emit) async {
    emit(ChooseLocationsLoading());
    late LatLng source;
    late LatLng destination;
    if (event.sourceCoordinates == null) {
      List<Location> sources = await locationFromAddress(event.sourceLocation);
      source = LatLng(sources[0].latitude, sources[0].longitude);
    } else {
      source = event.sourceCoordinates!;
    }
    if (event.destinationCoordinates == null) {
      List<Location> destinations =
          await locationFromAddress(event.destinationLocation);
      destination = LatLng(destinations[0].latitude, destinations[0].longitude);
    } else {
      destination = event.destinationCoordinates!;
    }

    emit(
      ChooseLocationsSucess(
          source, destination, event.sourceLocation, event.destinationLocation),
    );
  }

  void _onLocationSelectedFromList(SelectecLocationFromList event,
      Emitter<ChooseLocationsState> emit) async {
    emit(ChooseLocationsLoading());
    List<Placemark> curPosName = await placemarkFromCoordinates(
      event.sourceLatitude,
      event.sourcelongitude,
    );
    emit(
      ChooseLocationsSucess(
        LatLng(event.sourceLatitude, event.sourcelongitude),
        LatLng(event.destinationLatitude, event.destinationLongitude),
        curPosName[0].street!,
        event.destinationName,
      ),
    );
  }
}

class CurrentLocationBloc
    extends Bloc<CurrentLocationEvent, CurrentLocationState> {
  CurrentLocationBloc() : super(CurrentLocationInitial()) {
    on<CurrentLocationEvent>(_getCurrentLocation);
  }

  void _getCurrentLocation(
      CurrentLocationEvent event, Emitter<CurrentLocationState> emit) async {
    emit(CurrentLocationLoading());
    if (await Permission.location.request().isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      emit(CurrentLocationSuccess(
          LatLng(position.latitude, position.longitude)));
    } else {
      emit(CurrentLocationError());
    }
  }
}

  // @override
  // on<NamesState>((event,emit) {};)

  // @override
  // on<FetchNamesEvent>((event, emit) {
  //   // TODO: implement event handler
  // });
  
 
  
  // }

  //   _mapFetchNamesEventToState() async{

    // try {
    //   final response = await http.get(Uri.parse(
    //       'https://mocki.io/v1/a72e8fae-c302-47ff-bd4f-1d5c7e32df58'));

    //   if (response.statusCode == 200) {
    //     final data = jsonDecode(response.body);
    //     final names = List<String>.from(data['names']);
    //     emit(NamesLoaded(names));

    //   } else {
    //     emit(NamesError('Failed to fetch names'));
    //   }
      
    // } catch (error) {
    //   emit(NamesError('An error occurred'));
    // }
//   }
// }

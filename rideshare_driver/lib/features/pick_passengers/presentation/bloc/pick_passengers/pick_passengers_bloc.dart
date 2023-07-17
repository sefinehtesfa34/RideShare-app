import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/ride_offer.dart';
import '../../../domain/entity/ride_request.dart';
import '../../../domain/usecase/add_passenger_usecase.dart';

part 'pick_passengers_event.dart';
part 'pick_passengers_state.dart';

class PickPassengersBloc
    extends Bloc<PickPassengersEvent, PickPassengersState> {
  AddPassengerUseCase addPassenger;
  PickPassengersBloc(this.addPassenger) : super(PickPassengersInitial()) {
    on<PickPassenger>(_onPickPassenger);
  }
  _onPickPassenger(
    
      PickPassenger event, Emitter<PickPassengersState> emit) async {
    // call the api for adding if success add it else dont add
    emit(PickPassengersLoading());
    final result = await addPassenger(event.rideOffer.rideOfferId!);

    result.fold((failure) {
      emit(PickPassengersFailure());
    }, (bool updated) async {
      if (updated){
        emit(PickPassengersSuccess(event.rideOffer));
      } else{
        emit(PickPassengersFailure());
      }
      
    });
  }
}

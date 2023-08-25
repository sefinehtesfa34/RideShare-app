import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/ride_offer.dart';
import '../../../domain/entities/ride_request.dart';
import '../../../domain/usecases/ride_request_usecase.dart';

part 'ride_request_event.dart';
part 'ride_request_state.dart';

class RideRequestBloc extends Bloc<RideRequestEvent, RideRequestState> {
  final GetRideRequestUseCase getRideRequestUseCase;

  RideRequestBloc(this.getRideRequestUseCase) : super(RideRequestInitial()) {
    on<RideOfferEvent>(_onRideRequestOffer);
  }

  _onRideRequestOffer(
      RideOfferEvent event, Emitter<RideRequestState> emit) async {
    emit(RideRequestWaitingState());
    final Either<Failure, Stream<RideRequest>> requestStreamOrFailure =
        await getRideRequestUseCase(event.passenger);

    emit(_onrideRequestOrFailure(requestStreamOrFailure));
  }

  _onrideRequestOrFailure(
      Either<Failure, Stream<RideRequest>> requestStreamOrFailure) {
    return requestStreamOrFailure.fold((Failure failure) {
      return RideRequestFailureState(failure.message);
    }, (Stream<RideRequest> rideRequest) {
      return RideRequestSuccessState(rideRequest);
    });
  }
}

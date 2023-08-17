import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rideshare/features/passenger_on_journey/domain/usecases/ride_request_usecase.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/ride_offer.dart';
import '../../../domain/entities/ride_request.dart';

part 'ride_request_event.dart';
part 'ride_request_state.dart';


/// A BLoC responsible for managing the state of ride requests.
class RideRequestBloc extends Bloc<RideRequestEvent, RideRequestState> {
  final GetRideRequestUseCase getRideRequestUseCase;

  /// Creates a [RideRequestBloc] instance with the provided [getRideRequestUseCase].
  RideRequestBloc(this.getRideRequestUseCase) : super(RideRequestInitial()) {
    on<RideOfferEvent>(_onRideRequestOffer);
  }

  /// Emits a [RideRequestWaitingState] followed by either a [RideRequestSuccessState] or [RideRequestFailureState].
  void _onRideRequestOffer(
      RideOfferEvent event, Emitter<RideRequestState> emit) async {
    emit(RideRequestWaitingState());
    final Either<Failure, Stream<RideRequest>> requestStreamOrFailure =
        await getRideRequestUseCase(event.passenger);

    emit(_onRideRequestOrFailure(requestStreamOrFailure));
  }

  /// Handles the result of the ride request or failure.
  RideRequestState _onRideRequestOrFailure(
      Either<Failure, Stream<RideRequest>> requestStreamOrFailure) {
    return requestStreamOrFailure.fold((Failure failure) {
      return RideRequestFailureState(failure.message);
    }, (Stream<RideRequest> rideRequest) {
      return RideRequestSuccessState(rideRequest);
    });
  }
}

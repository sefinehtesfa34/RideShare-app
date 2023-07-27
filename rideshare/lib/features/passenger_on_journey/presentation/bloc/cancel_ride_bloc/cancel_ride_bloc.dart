import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/usecases/cancel_ride_usecase.dart';

part 'cancel_ride_event.dart';
part 'cancel_ride_state.dart';

class CancelRideBloc extends Bloc<CancelRideEvent, CancelRideState> {
  final CancelRideRequest cancelRideRequest;
  CancelRideBloc(this.cancelRideRequest) : super(CancelRideInitial()) {
    on<CancelRideTrigger>(_onCancelRide);
  }

  _onCancelRide(CancelRideTrigger event, Emitter<CancelRideState> emit) async {
    emit(CancelRideLoding());
    
    final Either<Failure, bool> requestStreamOrFailure =
        await cancelRideRequest(CancelRideParams(rideRequestId: event.rideRequestId,userPhone: event.userPhone));

    emit(_onCanceOrFailure(requestStreamOrFailure));
  }

  _onCanceOrFailure(
      Either<Failure, bool> requestStreamOrFailure) {
    return requestStreamOrFailure.fold((Failure failure) {
      return CancelRideFailed(failure.message);
    }, (bool isCanceled) {
      return CancelRideSuccess(isCanceled);
    });
  }
}

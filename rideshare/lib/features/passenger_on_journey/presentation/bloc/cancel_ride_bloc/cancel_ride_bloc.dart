import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/usecases/cancel_ride_usecase.dart';

part 'cancel_ride_event.dart';
part 'cancel_ride_state.dart';

/// A BLoC responsible for managing the state of ride cancellation requests.
class CancelRideBloc extends Bloc<CancelRideEvent, CancelRideState> {
  final CancelRideRequest cancelRideRequest;

  /// Creates a [CancelRideBloc] instance with the provided [cancelRideRequest].
  CancelRideBloc(this.cancelRideRequest) : super(CancelRideInitial()) {
    on<CancelRideTrigger>(_onCancelRide);
  }

  /// Handles the ride cancellation trigger event.
  ///
  /// Emits a [CancelRideLoading] state followed by either a [CancelRideSuccess] or [CancelRideFailed] state.
  void _onCancelRide(CancelRideTrigger event, Emitter<CancelRideState> emit) async {
    emit(CancelRideLoading());
    
    final Either<Failure, bool> requestStreamOrFailure =
        await cancelRideRequest(CancelRideParams(rideRequestId: event.rideRequestId, userPhone: event.userPhone));

    emit(_onCancelOrFailure(requestStreamOrFailure));
  }

  /// Handles the result of the ride cancellation or failure.
  CancelRideState _onCancelOrFailure(
      Either<Failure, bool> requestStreamOrFailure) {
    return requestStreamOrFailure.fold((Failure failure) {
      return CancelRideFailed(failure.message);
    }, (bool isCanceled) {
      return CancelRideSuccess(isCanceled);
    });
  }
}

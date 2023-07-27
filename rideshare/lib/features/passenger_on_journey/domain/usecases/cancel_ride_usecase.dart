import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/ride_repository.dart';

class CancelRideRequest extends UseCase<bool, CancelRideParams> {
  final RideRepository repository;

  CancelRideRequest(this.repository);

  @override
  Future<Either<Failure, bool>> call(CancelRideParams params) async {
    return await repository.cancelRideRequest(
        params.rideRequestId, params.userPhone);
  }
}

class CancelRideParams extends Equatable {
  final String rideRequestId;
  final String userPhone;

  const CancelRideParams({
    required this.rideRequestId,
    required this.userPhone,
  });

  @override
  List<Object> get props => [rideRequestId, userPhone];
}

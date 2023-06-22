import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/exception.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/feeds/profile/data/datasource/remote_datasource.dart';
import 'package:rideshare/features/feeds/profile/domain/entity/passenger.dart';
import 'package:rideshare/features/feeds/profile/domain/repository/passenger_repository.dart';

class PassengerRepositoryImpl extends PassengerRepository {
  final PassengerRemoteDataSource passengerRemoteDataSource;
  PassengerRepositoryImpl({required this.passengerRemoteDataSource});
  @override
  Future<Either<Failure, Passenger>> updateData(
      {String? fullNmae, int? age}) async {
    try {
      final Passenger passenger = await passengerRemoteDataSource.updateData(
          fullName: fullNmae, age: age);
      return Right<Failure, Passenger>(passenger);
    } on ServerException {
      return const Left<Failure, Passenger>(ServerFailure('Server Failure'));
    }
  }

  @override
  List<Object?> get props => [];
}

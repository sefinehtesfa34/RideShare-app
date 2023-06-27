import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entity/passenger.dart';
import '../../domain/repository/passenger_repository.dart';
import '../datasource/remote_datasource.dart';

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

  @override
  Future<Either<Failure, Passenger>> getData() async {
    try {
      return Right<Failure, Passenger>(
          await passengerRemoteDataSource.getData());
    } on ServerException {
      return const Left<Failure, Passenger>(ServerFailure('Server Failure'));
    }
  }
}

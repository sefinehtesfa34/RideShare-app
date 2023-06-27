import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/core/usecases/usecase.dart';

import '../entity/passenger.dart';
import '../repository/passenger_repository.dart';

class UpdatePassengerProfileUsecase extends UseCase<Passenger, Params> {
  final PassengerRepository passengerRepository;
  UpdatePassengerProfileUsecase({required this.passengerRepository});
  @override
  Future<Either<Failure, Passenger>> call(Params params) async {
    return await passengerRepository.updateData(
        fullNmae: params.fullName, age: params.age);
  }
}

class GetPassengerUsecase extends UseCase<Passenger, void> {
  final PassengerRepository passengerRepository;
  GetPassengerUsecase({required this.passengerRepository});
  
  @override
  Future<Either<Failure, Passenger>> call(void params) async {
    return await passengerRepository.getData();
  }

}

class Params {
  String? fullName;
  int? age;

  Params({this.age, this.fullName});
}

import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/core/usecases/usecase.dart';
import 'package:rideshare/features/feeds/profile/domain/entity/passenger.dart';
import 'package:rideshare/features/feeds/profile/domain/repository/passenger_repository.dart';

class UpdatePassengerProfileUsecase extends UseCase<Passenger, Params> {
  final PassengerRepository passengerRepository;
  UpdatePassengerProfileUsecase({required this.passengerRepository});
  @override
  Future<Either<Failure, Passenger>> call(Params params) async {
    return await passengerRepository.updateData(
        fullNmae: params.fullName, age: params.age);
  }
}

class Params {
  String? fullName;
  int? age;
  Params({this.age, this.fullName});
}

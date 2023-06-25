import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/destination.dart';

abstract class DestinationRepository {
  Future<Either<Failure, List<Destination>>> fetchPassengerHistory();
}

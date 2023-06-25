import 'package:dartz/dartz.dart';

import 'package:rideshare/core/errors/failures.dart';

import '../entities/destination.dart';
import '../repositories/destination_repository.dart';

class FetchPassengerHistoryUseCase {
  final DestinationRepository destinationRepository;

  FetchPassengerHistoryUseCase(this.destinationRepository);

  Future<Either<Failure, List<Destination>>> call() async {
    return await destinationRepository.fetchPassengerHistory();
  }
}

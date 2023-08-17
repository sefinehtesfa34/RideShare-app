import 'package:dartz/dartz.dart';

import 'package:rideshare/core/errors/failures.dart';

import '../entities/destination.dart';
import '../repositories/destination_repository.dart';
///
/// This use case is responsible for fetching the history of destinations for a passenger.
/// It communicates with the [DestinationRepository] to retrieve the passenger's history.
/// The result is returned as a [List] of [Destination] objects wrapped in an [Either] type,
/// representing either a [Failure] or a successful result.
///

class FetchPassengerHistoryUseCase {
  final DestinationRepository destinationRepository;

  /// Creates a [FetchPassengerHistoryUseCase] with the provided [destinationRepository].
  FetchPassengerHistoryUseCase(this.destinationRepository);

  /// Fetches the passenger's history of destinations.
  ///
  /// Returns an [Either] where the left side represents a [Failure] and the right side
  /// contains a [List] of [Destination] if the operation is successful.
  ///
  /// Throws [Exception] if an error occurs during the fetch operation.
  Future<Either<Failure, List<Destination>>> call() async {
    return await destinationRepository.fetchPassengerHistory();
  }
}

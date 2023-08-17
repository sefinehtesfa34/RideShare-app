import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/destination.dart';

/// Destination Repository Interface
///
/// This interface defines the contract for fetching passenger history destinations.
/// Implementations of this interface are responsible for communicating with data sources,
/// such as remote APIs or local databases, to retrieve passenger history data.

abstract class DestinationRepository {
  /// Fetches the history of destinations for a passenger.
  ///
  /// Returns an [Either] where the left side represents a [Failure] if the fetch operation
  /// encounters an error, and the right side contains a [List] of [Destination] if successful.
  ///
  /// Throws [Exception] if an unexpected error occurs during the fetch operation.
  Future<Either<Failure, List<Destination>>> fetchPassengerHistory();
}

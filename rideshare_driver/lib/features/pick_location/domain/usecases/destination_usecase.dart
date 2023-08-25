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

/**
 * This file contains the use case for fetching passenger history.
 * 
 * Imports:
 * - dartz package for functional programming support.
 * - rideshare core errors for handling failures.
 * - destination entity and repository for accessing and manipulating destination data.
 * 
 * Class: FetchPassengerHistoryUseCase
 * - This class is responsible for fetching the passenger history.
 * - It uses the DestinationRepository to fetch the data.
 * 
 * Constructor:
 * - The constructor takes an instance of DestinationRepository as a parameter.
 * 
 * Method: call
 * - This method is responsible for initiating the fetch operation.
 * - It returns a Future that will complete with either a Failure or a List of Destination objects.
 * - It uses the fetchPassengerHistory method of the DestinationRepository to fetch the data.
 */
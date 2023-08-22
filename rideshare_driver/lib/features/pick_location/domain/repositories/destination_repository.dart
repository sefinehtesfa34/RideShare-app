import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/destination.dart';

abstract class DestinationRepository {
  Future<Either<Failure, List<Destination>>> fetchPassengerHistory();
}

/// destination_repository.dart
///
/// This file defines the abstract class DestinationRepository which outlines the contract for any concrete implementation of a destination repository.
///
/// The DestinationRepository has a single method fetchPassengerHistory which is expected to return a Future of Either Failure or a List of Destination objects.
///
/// Failure is a class that encapsulates any errors that may occur during the execution of the fetchPassengerHistory method.
///
/// Destination is an entity that represents a destination in the context of this application.
///
/// Imports:
/// - dartz: A library that provides functional programming utilities in Dart. In this file, it is used for the Either type.
/// - failures.dart: A file that defines the Failure class.
/// - destination.dart: A file that defines the Destination entity.
///
/// Usage:
/// Implementations of DestinationRepository should override the fetchPassengerHistory method to provide a concrete implementation of fetching passenger history.
///
/// Example:
/// dart
/// class MyDestinationRepository implements DestinationRepository {
/// @override
/// Future<Either<Failure, List<Destination>>> fetchPassengerHistory() {
/// // TODO: Implement fetchPassengerHistory
/// }
/// }
///
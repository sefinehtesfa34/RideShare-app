import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rideshare/features/passenger_on_journey/data/datasource/ride_request_api_provider.dart';
import 'package:rideshare/features/passenger_on_journey/domain/entities/ride_request.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/ride_offer.dart';

/// Ride Remote Data Source
///
/// Defines the contract for interacting with the remote data source
/// related to ride requests and offers.
abstract class RideRemoteDataSource {
  /// Retrieves a stream of ride requests for a given ride offer.
  ///
  /// Takes a [RideOffer] instance as input and returns a [Stream] of [RideRequest].
  /// Throws a [ServerException] if an error occurs during data retrieval.
  Future<Stream<RideRequest>> getRideRequest(RideOffer passenger);

  /// Cancels a ride request.
  ///
  /// Takes a ride request ID and user phone number as input.
  /// Returns a [bool] indicating the success of the cancellation.
  /// Throws a [ServerException] if an error occurs during the cancellation process.
  Future<bool> cancelRideRequest(String rideRequestId, String userPhone);
}

/// Implementation of the Ride Remote Data Source
///
/// Provides methods to interact with the remote data source related to ride requests and offers.
class RideRemoteDataSourceImpl implements RideRemoteDataSource {
  final RideRequestApiProvider rideRequestApiProvider;

  /// Creates a [RideRemoteDataSourceImpl] instance with the provided [rideRequestApiProvider].
  RideRemoteDataSourceImpl(this.rideRequestApiProvider);

  @override
  Future<Stream<RideRequest>> getRideRequest(RideOffer passenger) async {
    return rideRequestApiProvider.getRideRequestsForPassenger(passenger);
  }

  @override
  Future<bool> cancelRideRequest(String rideRequestId, String userPhone) async {
    try {
      // Simulating a delay to mimic the cancellation process.
      await Future.delayed(Duration(seconds: 2));
      return false; // Placeholder value, actual implementation should communicate with the server.
    } catch (ex) {
      throw ServerException("Couldn't cancel order"); // Throwing an exception in case of failure.
    }
  }
}

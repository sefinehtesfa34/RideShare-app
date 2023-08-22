import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/ride_offer.dart';
import '../../domain/entities/ride_request.dart';
import 'ride_request_api_provider.dart';

abstract class RideRemoteDataSource {
  Future<Stream<RideRequest>> getRideRequest(RideOffer passenger);
  Future<bool> cancelRideRequest(String rideRequestId, String userPhone);
}

class RideRemoteDataSourceImpl implements RideRemoteDataSource {
  final RideRequestApiProvider rideRequestApiProvider;

  RideRemoteDataSourceImpl(this.rideRequestApiProvider);

  @override
  Future<Stream<RideRequest>> getRideRequest(RideOffer passegner) async {
    await Future.delayed(Duration(seconds: 4));
    return rideRequestApiProvider.getRideRequestsForPassenger(passegner);
  }

  @override
  Future<bool> cancelRideRequest(String rideRequestId, String userPhone) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return false;
    } catch (ex) {
      throw ServerException("Couldn't cancel order");
    }
  }
}

/// `ride_remote_data_source.dart`
///
/// This file contains the abstract class `RideRemoteDataSource` and its implementation `RideRemoteDataSourceImpl`.
///
/// `RideRemoteDataSource` is an abstract class that declares two methods:
/// - `getRideRequest(RideOffer passenger)`: This method is expected to return a Stream of `RideRequest` objects for a given `RideOffer`.
/// - `cancelRideRequest(String rideRequestId, String userPhone)`: This method is expected to cancel a ride request and return a boolean indicating the success of the operation.
///
/// `RideRemoteDataSourceImpl` is a class that implements `RideRemoteDataSource`. It uses a `RideRequestApiProvider` to perform its operations.
/// - `getRideRequest(RideOffer passenger)`: This method returns a Stream of `RideRequest` objects for a given `RideOffer`. It simulates a delay of 4 seconds before returning the data.
/// - `cancelRideRequest(String rideRequestId, String userPhone)`: This method attempts to cancel a ride request. It simulates a delay of 2 seconds before returning false, indicating that the cancellation was unsuccessful. If an exception occurs during the operation, it throws a `ServerException`.
///
/// Exceptions:
/// - `ServerException`: This exception is thrown when an error occurs while cancelling a ride request.
///
/// Usage:
/// ```
/// final rideRequestApiProvider = RideRequestApiProvider();
/// final rideRemoteDataSource = RideRemoteDataSourceImpl(rideRequestApiProvider);
///
/// // Get ride requests for a passenger
/// final rideRequests = await rideRemoteDataSource.getRideRequest(passenger);
///
/// // Cancel a ride request
/// final success = await rideRemoteDataSource.cancelRideRequest(rideRequestId, userPhone);
/// ```
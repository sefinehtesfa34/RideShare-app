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

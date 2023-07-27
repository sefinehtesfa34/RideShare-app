import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rideshare/features/passenger_on_journey/data/datasource/ride_request_api_provider.dart';
import 'package:rideshare/features/passenger_on_journey/domain/entities/ride_request.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/ride_offer.dart';

abstract class RideRemoteDataSource {
  Future<Stream<RideRequest>> getRideRequest(RideOffer passenger);
  Future<bool> cancelRideRequest(String rideRequestId, String userPhone);
}

class RideRemoteDataSourceImpl implements RideRemoteDataSource {
  final RideRequestApiProvider rideRequestApiProvider;

  RideRemoteDataSourceImpl(this.rideRequestApiProvider);

  @override
  Future<Stream<RideRequest>> getRideRequest(RideOffer passegner) async {
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

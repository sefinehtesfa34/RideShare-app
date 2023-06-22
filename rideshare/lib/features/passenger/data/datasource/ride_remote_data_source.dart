import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rideshare/features/passenger/data/datasource/ride_request_api_provider.dart';
import 'package:rideshare/features/passenger/domain/entities/ride_request.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/passenger.dart';

abstract class RideRemoteDataSource {
  Future<Stream<RideRequest>> getRideRequest(Passenger passenger);
  Future<bool> cancelRideRequest(String rideRequestId, String userPhone);
}

class RideRemoteDataSourceImpl implements RideRemoteDataSource {
  final RideRequestApiProvider rideRequestApiProvider;

  RideRemoteDataSourceImpl(this.rideRequestApiProvider);

  @override
  Future<Stream<RideRequest>> getRideRequest(Passenger passegner) async {
    print("all ready");
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

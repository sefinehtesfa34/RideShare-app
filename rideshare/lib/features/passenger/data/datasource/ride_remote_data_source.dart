import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rideshare/features/passenger/data/datasource/ride_request_api_provider.dart';
import 'package:rideshare/features/passenger/domain/entities/ride_request.dart';

import '../../domain/entities/passenger.dart';

abstract class RideRemoteDataSource {
  Future<Stream<RideRequest>> getRideRequest(Passenger passenger);
}

class RideRemoteDataSourceImpl implements RideRemoteDataSource {
  final RideRequestApiProvider rideRequestApiProvider;

  RideRemoteDataSourceImpl(this.rideRequestApiProvider);

  @override
  Future<Stream<RideRequest>> getRideRequest(Passenger passegner) async {
    return rideRequestApiProvider.getRideRequestsForPassenger(passegner);
  }
}

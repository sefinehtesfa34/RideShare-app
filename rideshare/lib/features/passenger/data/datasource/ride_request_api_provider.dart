import 'dart:async';
import 'package:dio/dio.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../domain/entities/passenger.dart';
import '../../domain/entities/ride_request.dart';
import '../model/passenger_model.dart';
import '../model/ride_request_model.dart';

class RideRequestApiProvider {
  final String baseUrl;
  late final HubConnection hubConnection;
  late final StreamController<RideRequest> _rideRequestStreamController;

  RideRequestApiProvider({required this.baseUrl}) {
    hubConnection =
        HubConnectionBuilder().withUrl('$baseUrl/your/signalR/hub').build();
    _rideRequestStreamController = StreamController<RideRequest>.broadcast();
    setupHubConnection();
  }

  Future<void> setupHubConnection() async {
    await hubConnection.start();
    hubConnection.on('new_message', (dynamic data) {
      var rideRequest = RideRequestModel.fromJson(data);
      _rideRequestStreamController.add(rideRequest);
    });
  }

  Future<Stream<RideRequest>> getRideRequestsForPassenger(Passenger passenger) async {
    if (hubConnection.state == HubConnectionState.disconnected) {
      return Future.value(Stream.empty());
    }
    hubConnection.invoke('GetRideRequestsForPassenger',
        args: [PassengerModel.fromJson(PassengerModel.toJsonGivenPassenger(passenger))]);
    return _rideRequestStreamController.stream;
  }

  void dispose() {
    _rideRequestStreamController.close();
    hubConnection.stop();
  }
}

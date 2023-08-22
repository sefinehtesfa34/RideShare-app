import 'dart:async';
import 'package:signalr_core/signalr_core.dart';

import '../../domain/entities/ride_offer.dart';
import '../../domain/entities/ride_request.dart';
import '../models/passenger_model.dart';
import '../models/ride_request_model.dart';

class RideRequestApiProvider {
  final String baseUrl;
  late final HubConnection hubConnection;
  late final StreamController<RideRequest> _rideRequestStreamController;

  RideRequestApiProvider({required this.baseUrl}) {
    hubConnection =
        HubConnectionBuilder().withUrl('$baseUrl/rideshare').build();
    _rideRequestStreamController = StreamController<RideRequest>.broadcast();
    setupHubConnection();
  }

  Future<void> setupHubConnection() async {
    if (hubConnection.state == HubConnectionState.disconnected) {
      await hubConnection.start();
      hubConnection.on('MatchFound', (dynamic data) {
        var rideRequest = RideRequestModel.fromJson(data);
        _rideRequestStreamController.add(rideRequest);
      });
    }
  }

  Future<Stream<RideRequest>> getRideRequestsForPassenger(
      RideOffer passenger) async {
    if (hubConnection.state == HubConnectionState.disconnected) {
      return Future.value(Stream.empty());
    } else {
      hubConnection.invoke('GetRideRequestsForPassenger', args: [
        PassengerModel.fromJson(PassengerModel.toJsonGivenPassenger(passenger))
      ]);
      return _rideRequestStreamController.stream;
    }
  }

  void dispose() {
    _rideRequestStreamController.close();
    hubConnection.stop();
  }
}

/// `RideRequestApiProvider` is a class that provides methods to interact with the ride request API.
///
/// It uses SignalR for real-time communication with the server.
///
/// The class requires a `baseUrl` to be passed in the constructor to establish the connection.
///
/// It has a `StreamController` to handle the stream of `RideRequest` objects.
///
/// The `setupHubConnection` method is used to setup the SignalR connection and listen for 'MatchFound' events.
///
/// The `getRideRequestsForPassenger` method is used to get the ride requests for a specific passenger.
///
/// The `dispose` method is used to close the `StreamController` and stop the SignalR connection.
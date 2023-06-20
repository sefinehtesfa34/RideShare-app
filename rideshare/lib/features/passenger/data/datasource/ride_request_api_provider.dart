import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:web_socket_channel/io.dart';

import '../../domain/entities/passenger.dart';
import '../model/passenger_model.dart';
import '../model/ride_request_model.dart';

class RideRequestApiProvider {
  final String baseUrl;
  late final IOWebSocketChannel _webSocketChannel;
  late final Stream<RideRequestModel> _rideRequestStream;

  RideRequestApiProvider({required this.baseUrl}) {
    _webSocketChannel = IOWebSocketChannel.connect('wss://echo.websocket.org');

    //! for test purpose only
    addEvents();



    
    _rideRequestStream = _webSocketChannel.stream
        .map((event) => RideRequestModel.fromJson(json.decode(event)))
        .asBroadcastStream();
  }

  addEvents()  {
    for (int i = 0; i < 50; i++) {
    final message = {
        "driver_name": "John Doe",
        "driver_image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpFKCy24mG8PWrdkncsJki9h6UlTJMf7kPBT6AeQk7&s",
        "driver_rating_average_out_of_5": 4.7,
        "driver_reviews": 23,
        "car_model": "Toyota Camry",
        "available_seats": 2,
        "car_image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpFKCy24mG8PWrdkncsJki9h6UlTJMf7kPBT6AeQk7&s",
        "car_plate_number": "ABC 123",
        "driver_phone_number": "+1 (555) 123-4567",
        "car_location": {"latitude": 37.7749 + i * 0.1, "longitude": -122.4194 - i * 0.2}
      };
    print('Sending message ...');
    _webSocketChannel.sink.add(message);
  }

  }

  Future<Stream<RideRequestModel>> getRideRequestsForPassenger(
      Passenger passenger) {
    final String requestUrl = 'https://mocki.io/v1/888489a1-5c68-4f61-a1ef-7331e0bb6591';
    final Dio client = Dio(BaseOptions(baseUrl: requestUrl));
    final jsonBody =
        json.encode(PassengerModel.toJsonGivenPassenger(passenger));

    return client
        .get('',
            data: jsonBody,
            options: Options(headers: {
              'Content-Type': 'application/json',
            }))
        .then((response) => _rideRequestStream);
  }

  Future<void> closeWebSocket() async {
    await _webSocketChannel.sink.close();
  }
}

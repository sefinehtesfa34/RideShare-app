import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../domain/entities/location.dart';
import '../../domain/entities/ride_offer.dart';
import '../../domain/entities/ride_request.dart';
import '../../domain/entities/user.dart';
import '../model/passenger_model.dart';
import '../model/ride_request_model.dart';

class RideRequestApiProvider {
  final String baseUrl;
  late final HubConnection hubConnection;
  late final StreamController<RideRequest> _rideRequestStreamController;
  late Dio dio;
  final String token = dotenv.env['RIDE_REQUEST_API_PROVIDER_TOKEN']!;
  RideRequestApiProvider({required this.baseUrl}) {
    hubConnection = HubConnectionBuilder()
        .withUrl(
            'https://rideshare-swdm.onrender.com',
            HttpConnectionOptions(
              skipNegotiation: true,
              transport: HttpTransportType.webSockets,
              accessTokenFactory: () async => token,
            ))
        .withAutomaticReconnect()
        .build();
    setupHubConnection();
    _rideRequestStreamController = StreamController<RideRequest>.broadcast();

    dio = Dio();
  }

  Future<void> setupHubConnection() async {
    await hubConnection.start();
  }

  Future<Stream<RideRequest>> getRideRequestsForPassenger(
      RideOffer passenger) async {
    // if (hubConnection.state == HubConnectionState.disconnected) {
    //   return Future.value(Stream.empty());
    // }
    final url = 'https://rideshare-swdm.onrender.com/api/RideRequest';

    final requestData = {
      'origin': {
        'latitude': passenger.currentLocation.latitude,
        'longitude': passenger.currentLocation.longitude,
      },
      'destination': {
        'latitude': passenger.destination.latitude,
        'longitude': passenger.destination.longitude,
      },
      'numberOfSeats': passenger.seatsAllocated,
    };
    print('posting');
    print(requestData);
    try {
      final response = await dio.post(
        url,
        data: jsonEncode(requestData),
        options: Options(headers: {
          'Content-Type': 'application/json',
          "authorization": {
            //! passegner app
            "Bearer $token"
          }
        }),
      );
      if (response.statusCode == 201) {
        print('Ride request posted successfully!');
        
        hubConnection.on('Accepted', (dynamic data) {
          print("======================================");
          print(data);
          try {
            var encoded = json.decode(json.encode(data));
            print(encoded);
            var rideRequest = RideRequestModel.fromJson(encoded[0]);
            print("Here is the model,");
            print(rideRequest);
            _rideRequestStreamController.add(rideRequest);
          } catch (e) {
            print(e);
          }
        });
      } else {
        throw Exception("Server Error");
      }
    } catch (e) {
      print("Exception happend: $e");
      throw Exception("Server Error");
    }

    // Future.delayed(Duration(seconds: 5));
    // List<RideRequestModel> rideRequestList = [
    //   RideRequestModel(
    //     driverName: 'John Doe',
    //     driverImageURL: 'https://example.com/profile.jpg',
    //     driverRatingAverageOutOf5: 4.5,
    //     driverReviews: 100,
    //     carModel: 'Toyota Camry',
    //     availableSeats: 2,
    //     carImageURL: 'https://example.com/car.jpg',
    //     carPlateNumber: 'ABC-123',
    //     driverPhoneNumber: '555-1234',
    //     carLocation: Location(
    //       latitude: 37.7749,
    //       longitude: -122.4194,
    //     ),
    //     passengersList: [
    //       RideOffer(
    //         user: User(
    //           fullname: 'Alice Smith',
    //           imageUrl: 'https://example.com/profile.jpg',
    //           phoneNumber: '555-5678',
    //           age: 25,
    //         ),
    //         currentLocation: Location(
    //           latitude: 37.7739,
    //           longitude: -122.4312,
    //         ),
    //         destination: Location(
    //           latitude: 37.7749,
    //           longitude: -122.4194,
    //         ),
    //         seatsAllocated: 1,
    //         price: 10.0,
    //       ),
    //     ],
    //   ),
    //   RideRequestModel(
    //     driverName: 'John Doe',
    //     driverImageURL: 'https://example.com/profile.jpg',
    //     driverRatingAverageOutOf5: 4.5,
    //     driverReviews: 100,
    //     carModel: 'Toyota Camry',
    //     availableSeats: 2,
    //     carImageURL: 'https://example.com/car.jpg',
    //     carPlateNumber: 'ABC-123',
    //     driverPhoneNumber: '555-1234',
    //     carLocation: Location(
    //       latitude: 37.7749,
    //       longitude: -122.4194,
    //     ),
    //     passengersList: [
    //       RideOffer(
    //         user: User(
    //           fullname: 'Alice Smith',
    //           imageUrl: 'https://example.com/profile.jpg',
    //           phoneNumber: '555-5678',
    //           age: 25,
    //         ),
    //         currentLocation: Location(
    //           latitude: 37.7739,
    //           longitude: -122.4312,
    //         ),
    //         destination: Location(
    //           latitude: 37.7749,
    //           longitude: -122.4194,
    //         ),
    //         seatsAllocated: 1,
    //         price: 10.0,
    //       ),
    //       RideOffer(
    //         user: User(
    //           fullname: 'Abebe Bikila',
    //           imageUrl: 'https://example.com/profile.jpg',
    //           phoneNumber: '555-5678',
    //           age: 25,
    //         ),
    //         currentLocation: Location(
    //           latitude: 37.7739,
    //           longitude: -122.4312,
    //         ),
    //         destination: Location(
    //           latitude: 37.7749,
    //           longitude: -122.4194,
    //         ),
    //         seatsAllocated: 1,
    //         price: 10.0,
    //       ),
    //     ],
    //   ),
    //   RideRequestModel(
    //     driverName: 'Jane Smith',
    //     driverImageURL: 'https://example.com/profile.jpg',
    //     driverRatingAverageOutOf5: 3.8,
    //     driverReviews: 75,
    //     carModel: 'Honda Accord',
    //     availableSeats: 3,
    //     carImageURL: 'https://example.com/car.jpg',
    //     carPlateNumber: 'XYZ-789',
    //     driverPhoneNumber: '555-4321',
    //     carLocation: Location(
    //       latitude: 9,
    //       longitude: 38,
    //     ),
    //     passengersList: [],
    //   ),
    // ];

    // const interval = Duration(seconds: 20);
    // _rideRequestStreamController.add(rideRequestList.last);

    // Timer.periodic(interval, (timer) {
    //   // Add a ride request to the stream every interval seconds
    //   if (rideRequestList.isNotEmpty) {
    //     _rideRequestStreamController.add(rideRequestList.removeLast());
    //   }

    //   // Stop the timer when there are no more ride requests to add
    //   if (rideRequestList.isEmpty) {
    //     timer.cancel();
    //     dispose();
    //   }
    // });
    hubConnection.on('OnDrop', (dynamic data) {
      dispose();
    });

    return _rideRequestStreamController.stream;
  }

  void dispose() {
    _rideRequestStreamController.close();
    hubConnection.stop();
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rideshare/core/errors/exceptions.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entity/location.dart';
import '../../domain/entity/ride_offer.dart';
import '../../domain/entity/ride_request.dart';
import '../../domain/entity/user.dart';
import '../model/passenger_model.dart';

abstract class RideOfferApi {
  Future<Stream<List<RideOffer>>> getRideOffers(RideRequest request);
  Future<bool> addPassenger(String rideOfferId);
  updateDriverLocation(StreamController carLocationController);
  stopSendingLocation(StreamController carLocationStreamController);
  Future<bool> dropPassegner(String rideOfferId);
  // Future<Either<Failure, void>> createRideOffer(RideOffer rideOffer);
  // Future<Either<Failure, void>> updateRideOffer(RideOffer rideOffer);
  // Future<Either<Failure, void>> deleteRideOffer(String id);
}

class RideOfferApiImpl implements RideOfferApi {
  late HubConnection hubConnection;
  final String baseUrl;
  late Dio dio;
  late final StreamController<List<RideOffer>> _rideOfferStreamController;
  final constToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImN0eSI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ByaW1hcnlzaWQiOiJlOGU1YjkxNi1mYmU3LTQzMzMtYmE5Mi01Mzg2MGExYmQwNDciLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJZYXJlZCBUc2VnYXllKzI1MTk4Mjk4NTY3NiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiWWFyZWRUc2VnYXllKzI1MTk4Mjk4NTY3NiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJZYXJlZFRzZWdheWUrMjUxOTgyOTg1Njc2IiwiRnVsbE5hbWUiOiJZYXJlZCBUc2VnYXllIiwiUGhvbmVOdW1iZXIiOiIrMjUxOTgyOTg1Njc2IiwiUm9sZXMiOiJEcml2ZXIiLCJleHAiOjE2ODgyMDE0NTUsImlzcyI6Ind3dy5leGFtcGxlLmNvbSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.auR2gKaQ0Dad3LiKt7W86lzt4UMMd_zwuHtILZdyyuo";

  RideOfferApiImpl({required this.baseUrl}) {
    print("Came here =====================");
    print('$baseUrl/rideshare');
    dio = Dio();
    final token = constToken;
    hubConnection = HubConnectionBuilder()
        .withUrl(
            '$baseUrl/rideshare',
            HttpConnectionOptions(
              skipNegotiation: true,
              transport: HttpTransportType.webSockets,
              accessTokenFactory: () async => token,
            ))
        .withAutomaticReconnect()
        .build();

    startHub();
    _rideOfferStreamController = StreamController<List<RideOffer>>.broadcast();
  }

  startHub() async {
    await hubConnection.start();
  }

  // Define hub method names
  // static const _getRideOffersMethod = 'GetRideOffers';
  // static const _createRideOfferMethod = 'CreateRideOffer';
  // static const _updateRideOfferMethod = 'UpdateRideOffer';
  // static const _deleteRideOfferMethod = 'DeleteRideOffer';

  @override
  updateDriverLocation(StreamController carLocationController) {
    carLocationController.stream.listen((rideRequest) async {
      await hubConnection.invoke('UpdateLocation', args: [rideRequest]);
    });
  }

  @override
  Future<bool> dropPassegner(String rideOfferId) async {
    try {
      await hubConnection.invoke('Drop', args: [int.parse(rideOfferId)]);
      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  @override
  Future<bool> addPassenger(String rideOfferId) async {
    try {
      await hubConnection
          .invoke('AddPassenger', args: [int.parse(rideOfferId)]);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  stopSendingLocation(StreamController carLocationStreamController) {
    carLocationStreamController.close();
  }

  @override
  Future<Stream<List<RideOffer>>> getRideOffers(RideRequest request) async {
    List<RideOffer> cachedRideOffers = [];
    print("I am getting you the ride offers");
    final url = 'https://rideshare-app.onrender.com/api/RideOffers';
    final requestData = {
      "driverId": 18,
      "vehicleId": 11,
      "currentLocation": {
        "latitude": request.carLocation.latitude,
        "longitude": request.carLocation.longitude
      },
      "destination": {
        "latitude": request.destination.latitude,
        "longitude": request.destination.longitude
      }
    };
    print(requestData);
    try {
      final response = await dio.post(
        url,
        data: requestData,
        options: Options(headers: {
          'Content-Type': 'application/json',
          "Authorization": {"Bearer $constToken"}
        }),
      );
      if (response.statusCode == 201) {
        print('Ride request posted successfully!');
        hubConnection.on('MatchFound', (dynamic data) {
          print("======================================");
          print(data);
          try {
            var encoded = json.decode(json.encode(data));

            var rideRequest = RideOfferModel.fromJson(encoded[0]);
            print("Here is the model,");
            print(rideRequest);
            cachedRideOffers.add(rideRequest);
            _rideOfferStreamController.add(cachedRideOffers);
          } catch (e) {
            print(e);
          }
        });
      } else {
        throw Exception("Server Error");
      }
    } catch (e) {
      print(e);
      throw Exception("Server Error");
    }

    // List rideOfferList = [
    //   RideOfferModel(
    //     rideOfferId: '1',
    //     user: User(
    //       fullname: 'John Doe',
    //       imageUrl: 'https://example.com/profile.jpg',
    //       phoneNumber: '555-1234',
    //       age: 30,
    //     ),
    //     currentLocation: Location(
    //       latitude: 37.7749,
    //       longitude: -122.4194,
    //     ),
    //     destination: Location(
    //       latitude: 37.7739,
    //       longitude: -122.4312,
    //     ),
    //     seatsAllocated: 2,
    //     price: 10.0,
    //   ),
    //   RideOfferModel(
    //     rideOfferId: '2',
    //     user: User(
    //       fullname: 'Jane Smith',
    //       imageUrl: 'https://example.com/profile.jpg',
    //       phoneNumber: '555-5678',
    //       age: 25,
    //     ),
    //     currentLocation: Location(
    //       latitude: 37.7715,
    //       longitude: -122.4131,
    //     ),
    //     destination: Location(
    //       latitude: 37.7749,
    //       longitude: -122.4194,
    //     ),
    //     seatsAllocated: 1,
    //     price: 15.0,
    //   ),
    // ];
    // const interval = Duration(seconds: 3);

    // Timer.periodic(interval, (timer) {
    //   // Add a ride offer to the stream every interval seconds
    //   if (rideOfferList.isNotEmpty) {
    //     cachedRideOffers.add(rideOfferList.removeLast());
    //     _rideOfferStreamController.add(cachedRideOffers);
    //   }

    //   // Stop the timer when there are no more ride offers to add
    //   if (rideOfferList.isEmpty) {
    //     timer.cancel();
    //     _rideOfferStreamController.close();
    //   }
    // });
    return _rideOfferStreamController.stream;
  }

  void dispose() {
    _rideOfferStreamController.close();
    hubConnection.stop();
  }
}






 // try {
    //   final response = await dio.get(
    //       'https://mocki.io/v1/2226233f-e0f1-48ed-a92b-945413926dcc',
    //       queryParameters: {'sort': sort});
    //   final List<RideOffer> rideOffers = [];
    //   for (final offer in response.data) {
    //     rideOffers.add(RideOfferModel.fromJson(offer));
    //   }
    //   return rideOffers;
    // } catch (ex) {
    //   throw ServerException("Server Error");
    // }



    /**
 * This file contains the data source for the ride offer feature of the application.
 * It includes the abstract class `RideOfferApi` and its implementation `RideOfferApiImpl`.
 * 
 * The `RideOfferApi` abstract class declares the methods that must be implemented by any class that aims to act as a data source for ride offers.
 * 
 * The `RideOfferApiImpl` class implements the `RideOfferApi` abstract class. It uses the `dio` package for HTTP requests and the `signalr_core` package for real-time communication.
 * 
 * The `RideOfferApiImpl` class has the following methods:
 * 
 * - `updateDriverLocation`: Listens to a stream of driver location updates and sends them to the server.
 * - `dropPassenger`: Sends a request to the server to drop a passenger from a ride offer.
 * - `addPassenger`: Sends a request to the server to add a passenger to a ride offer.
 * - `stopSendingLocation`: Closes the stream of driver location updates.
 * - `getRideOffers`: Sends a ride request to the server and listens for ride offers in response.
 * - `dispose`: Closes the stream of ride offers and stops the SignalR connection.
 * 
 * The `RideOfferApiImpl` class also has a private `_rideOfferStreamController` that it uses to manage the stream of ride offers.
 * 
 * Note: The `RideOfferApiImpl` class uses a hardcoded token for authentication. This is not secure and should be replaced with a secure method of authentication.
 */
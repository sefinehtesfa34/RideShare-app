import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rideshare/core/errors/exceptions.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entity/location.dart';
import '../../domain/entity/ride_offer.dart';
import '../../domain/entity/user.dart';
import '../model/passenger_model.dart';

abstract class RideOfferApi {
  Future<Stream<List<RideOffer>>> getRideOffers();
  Future<bool> addPassenger(String rideOfferId);
  updateDriverLocation(StreamController carLocationController);
  stopSendingLocation(StreamController carLocationStreamController);
  // Future<Either<Failure, void>> createRideOffer(RideOffer rideOffer);
  // Future<Either<Failure, void>> updateRideOffer(RideOffer rideOffer);
  // Future<Either<Failure, void>> deleteRideOffer(String id);
}

class RideOfferApiImpl implements RideOfferApi {
  late HubConnection hubConnection;
  final String baseUrl;
  late Dio dio;
  late final StreamController<List<RideOffer>> _rideOfferStreamController;

  RideOfferApiImpl({required this.baseUrl}) {
    dio = Dio();
    hubConnection =
        HubConnectionBuilder().withUrl('$baseUrl/rideshare').build();

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
  Future<bool> addPassenger(String rideOfferId) async {
    // final response =
    //     await hubConnection.invoke('PassengerAdded', args: [rideOfferId]);
    final response = {"status": 200};

    if (response['status'] == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  stopSendingLocation(StreamController carLocationStreamController) {
    carLocationStreamController.close();
  }

  @override
  Future<Stream<List<RideOffer>>> getRideOffers() async {
    List<RideOffer> cachedRideOffers = [];
    print("I am getting you the ride offers");
    // hubConnection.on('MatchFound', (dynamic data) {
    //   var rideRequest = RideOfferModel.fromJson(data);
    //   _rideOfferStreamController.add(rideRequest);
    // });
    List rideOfferList = [
      RideOfferModel(
        rideOfferId: '1',
        user: User(
          fullname: 'John Doe',
          imageUrl: 'https://example.com/profile.jpg',
          phoneNumber: '555-1234',
          age: 30,
        ),
        currentLocation: Location(
          latitude: 37.7749,
          longitude: -122.4194,
        ),
        destination: Location(
          latitude: 37.7739,
          longitude: -122.4312,
        ),
        seatsAllocated: 2,
        price: 10.0,
      ),
      RideOfferModel(
        rideOfferId: '2',
        user: User(
          fullname: 'Jane Smith',
          imageUrl: 'https://example.com/profile.jpg',
          phoneNumber: '555-5678',
          age: 25,
        ),
        currentLocation: Location(
          latitude: 37.7715,
          longitude: -122.4131,
        ),
        destination: Location(
          latitude: 37.7749,
          longitude: -122.4194,
        ),
        seatsAllocated: 1,
        price: 15.0,
      ),
    ];
    const interval = Duration(seconds: 3);

    Timer.periodic(interval, (timer) {
      // Add a ride offer to the stream every interval seconds
      if (rideOfferList.isNotEmpty) {
        cachedRideOffers.add(rideOfferList.removeLast());
        _rideOfferStreamController.add(cachedRideOffers);
      }

      // Stop the timer when there are no more ride offers to add
      if (rideOfferList.isEmpty) {
        timer.cancel();
        _rideOfferStreamController.close();
      }
    });
    return _rideOfferStreamController.stream;
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
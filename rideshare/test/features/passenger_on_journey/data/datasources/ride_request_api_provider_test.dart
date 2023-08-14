import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:rideshare/features/passenger_on_journey/data/datasource/ride_request_api_provider.dart';
import 'package:rideshare/features/passenger_on_journey/domain/entities/location.dart';
import 'package:rideshare/features/passenger_on_journey/domain/entities/ride_offer.dart';
import 'package:rideshare/features/passenger_on_journey/domain/entities/ride_request.dart';
import 'package:rideshare/features/passenger_on_journey/domain/entities/user.dart';
import 'package:signalr_core/signalr_core.dart';

import 'ride_request_api_provider_test.mocks.dart';

@GenerateMocks([Dio, HubConnectionBuilder, HubConnection])
void main() async {
  print('hello');
  await dotenv.load();

  late RideRequestApiProvider apiProvider;
  late MockDio mockDio;
  late MockHubConnectionBuilder mockHubConnectionBuilder;
  late HubConnection mockHubConnection;

  setUp(() {
    mockDio = MockDio();
    mockHubConnectionBuilder = MockHubConnectionBuilder();
    mockHubConnection = MockHubConnection();
    apiProvider = RideRequestApiProvider(
      baseUrl: 'https://rideshare-swdm.onrender.com/rideshare',
    );
    apiProvider.dio = mockDio;
    // apiProvider.hubConnection = mockHubConnection;

    when(mockHubConnectionBuilder.withUrl(
      any,
      any,
    )).thenReturn(mockHubConnectionBuilder);
    when(mockHubConnectionBuilder.withAutomaticReconnect())
        .thenReturn(mockHubConnectionBuilder);
    when(mockHubConnectionBuilder.build()).thenReturn(mockHubConnection);
    when(mockDio.post(any,
            data: anyNamed('data'), options: anyNamed('options')))
        .thenAnswer((_) async => Response(
            data: [], requestOptions: RequestOptions(), statusCode: 201));
  });

  group('getRideRequestsForPassenger', () {
    final tUser = User(
      fullname: 'John Doe',
      phoneNumber: '+1234567890',
      age: 30,
    );
    final tPassenger = RideOffer(
      accepted: true,
      originAddress: 'Origin Address',
      destinationAddress: 'Destination Address',
      user: tUser,
      status: 'Active',
      rideOfferId: '123456',
      currentLocation: Location(
        latitude: 37.7749,
        longitude: -122.4194,
      ),
      destination: Location(
        latitude: 37.3382,
        longitude: -121.8863,
      ),
      seatsAllocated: 1,
      price: 25.0,
    );

    final tResponseData = [
      {
        'driverName': 'John',
        'driverImageURL': 'https://example.com/driver.jpg',
        'driverRatingAverageOutOf5': 4.5,
        'carModel': 'Toyota Camry',
        'availableSeats': 3,
        'carImageURL': 'https://example.com/car.jpg',
        'carPlateNumber': 'ABC123',
        'driverPhoneNumber': '555-555-5555',
        'carLocation': {
          'latitude': 37.7749,
          'longitude': -122.4194,
        },
        'passengersList': [],
      }
    ];

    final tRideRequest = RideRequest.fromJson(tResponseData[0]);

    test('should return a stream of ride requests', () async {
      // print('Starting test...');
      // arrange
      when(mockHubConnection.start()).thenAnswer((_) async {});
      // print('Starting test...1');
      when(mockHubConnection.state).thenReturn(HubConnectionState.connected);
      print('Starting test...2');
      when(mockDio.post(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(),
                data: tResponseData,
                statusCode: 201,
              ));
      print('Starting test...3');
      // act
      final rideRequestStream = await apiProvider.getRideRequestsForPassenger(
        tPassenger,
      );
      rideRequestStream.listen((event) {});
      print("stream");
      print(rideRequestStream);
      print("after");
      final rideRequests = await rideRequestStream.toList();
      print('to list');
      print(rideRequests);
      // assert
      // print('Starting test...4');
      expect(rideRequests.length, 1);
      // print('Starting test...5');
      expect(rideRequests[0], tRideRequest);
      // print('Starting test...6');
    });

    test('should return an empty stream if disconnected', () async {
      // arrange
      when(mockHubConnection.state).thenReturn(HubConnectionState.disconnected);
      // act
      final rideRequestStream = await apiProvider.getRideRequestsForPassenger(
        tPassenger,
      );
      final rideRequests = await rideRequestStream.toList();
      // assert
      expect(rideRequests.length, 0);
    });

    test('should throw an exception if the response is not successful', () {
      // arrange
      when(mockDio.post(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(),
                data: {'message': 'Error'},
                statusCode: 400,
              ));
      // act
      final rideRequestStream =
          apiProvider.getRideRequestsForPassenger(tPassenger);
      // assert
      expect(() async => (await rideRequestStream).toList(), throwsException);
    });
  });
}

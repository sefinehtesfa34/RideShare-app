import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/features/pick_location/data/datasources/ride_request_api_provider.dart';

import 'package:rideshare/features/pick_location/domain/entities/ride_offer.dart';
import 'package:signalr_core/signalr_core.dart';

import 'ride_request_api_provider_test.mocks.dart';

@GenerateMocks([HubConnection, RideOffer, RideRequestApiProvider])
void main() {
  late MockRideRequestApiProvider rideRequestApiProvider;
  late MockHubConnection mockHubConnection;
  late MockRideOffer mockRideOffer;

  setUp(() {
    mockHubConnection = MockHubConnection();
    mockRideOffer = MockRideOffer();
    rideRequestApiProvider = MockRideRequestApiProvider();
  });

  group('setupHubConnection', () {
    test('starts the connection if it is disconnected', () async {
      when(mockHubConnection.state).thenReturn(HubConnectionState.disconnected);
      await rideRequestApiProvider.setupHubConnection();
      verify(rideRequestApiProvider.setupHubConnection()).called(1);
      verify(mockHubConnection.start()).called(1);
    });

    test('does not start the connection if it is not disconnected', () async {
      when(mockHubConnection.state).thenReturn(HubConnectionState.connected);
      await rideRequestApiProvider.setupHubConnection();
      verifyNever(mockHubConnection.start());
    });
  });

  group('getRideRequestsForPassenger', () {
    test('returns an empty stream if the connection is disconnected', () async {
      when(mockHubConnection.state).thenReturn(HubConnectionState.disconnected);
      final result = await rideRequestApiProvider
          .getRideRequestsForPassenger(mockRideOffer);
      expect(result, equals(Stream.empty()));
    });

    test(
        'invokes GetRideRequestsForPassenger if the connection is not disconnected',
        () async {
      when(mockHubConnection.state).thenReturn(HubConnectionState.connected);
      await rideRequestApiProvider.getRideRequestsForPassenger(mockRideOffer);
      verify(mockHubConnection
          .invoke('GetRideRequestsForPassenger', args: [any])).called(1);
    });
  });

  test('dispose', () {
    rideRequestApiProvider.dispose();
    verify(mockHubConnection.stop()).called(1);
  });
}

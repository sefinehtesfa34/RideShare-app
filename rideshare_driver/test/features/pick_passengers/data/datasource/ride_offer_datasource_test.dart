import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/features/pick_passengers/data/datasource/ride_offer_datasource.dart';

import 'package:signalr_core/signalr_core.dart';

import 'ride_offer_datasource_test.mocks.dart';

@GenerateMocks([HubConnection])
void main() {
  late RideOfferApiImpl rideOfferApiImpl;
  late MockHubConnection mockHubConnection;

  setUp(() {
    mockHubConnection = MockHubConnection();
    rideOfferApiImpl = RideOfferApiImpl(
      baseUrl: 'http://test.com',
    );
  });

  group('addPassenger', () {
    final tRideOfferId = '1';

    test('should return true when the call to hubConnection.invoke is successful', () async {
      // arrange
      // when(mockHubConnection.invoke('AddPassenger', args: [int.parse(tRideOfferId)])).thenAnswer((_) async => null);
      // act
      final result = await rideOfferApiImpl.addPassenger(tRideOfferId);
      // assert
      expect(result, true);
      verify(mockHubConnection.invoke('AddPassenger', args: [int.parse(tRideOfferId)]));
      // verifyNoMoreInteractions(mockHubConnection);
    });

    test('should return false when the call to hubConnection.invoke throws an exception', () async {
      // arrange
      when(mockHubConnection.invoke('AddPassenger', args: [int.parse(tRideOfferId)])).thenThrow(Exception());
      // act
      final result = await rideOfferApiImpl.addPassenger(tRideOfferId);
      // assert
      expect(result, false);
      verify(mockHubConnection.invoke('AddPassenger', args: [int.parse(tRideOfferId)]));
      // verifyNoMoreInteractions(mockHubConnection);
    });
  });

  // Similar tests can be written for other methods like dropPassenger, updateDriverLocation, etc.
}

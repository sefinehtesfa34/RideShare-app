import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/pick_location/domain/entities/location.dart';


void main() {
  group('Location', () {
    final tLatitude = 1.0;
    final tLongitude = 1.0;
    final tLocation = Location(latitude: tLatitude, longitude: tLongitude);

    test('should be a subclass of Equatable entity', () async {
      // assert
      expect(tLocation, isA<Equatable>());
    });

    test('should return correct props values', () async {
      // assert
      expect(tLocation.props, [tLatitude, tLongitude]);
    });

    group('fromJson', () {
      test('should return a valid Location object', () async {
        // arrange
        final Map<String, dynamic> jsonMap = {
          'latitude': tLatitude,
          'longitude': tLongitude,
        };
        // act
        final result = Location.fromJson(jsonMap);
        // assert
        expect(result, tLocation);
      });
    });

    group('toJson', () {
      test('should return a JSON map containing the proper data', () async {
        // act
        final result = tLocation.toJson();
        // assert
        final expectedMap = {
          'latitude': tLatitude,
          'longitude': tLongitude,
        };
        expect(result, expectedMap);
      });
    });
  });
}
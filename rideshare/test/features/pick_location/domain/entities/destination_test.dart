import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/pick_location/domain/entities/destination.dart';

void main() {
  group('Destination', () {
    test('should create a Destination instance with correct properties', () {
      // arrange
      final name = 'Test';
      final latitude = 1.0;
      final longitude = 2.0;

      // act
      final destination = Destination(
        name: name,
        latitude: latitude,
        longitude: longitude,
      );

      // assert
      expect(destination.name, equals(name));
      expect(destination.latitude, equals(latitude));
      expect(destination.longitude, equals(longitude));
    });

    test(
        'should be equal to another Destination instance with the same properties',
        () {
      // arrange
      final destination1 =
          Destination(name: 'Test', latitude: 1.0, longitude: 2.0);
      final destination2 =
          Destination(name: 'Test', latitude: 1.0, longitude: 2.0);

      // act/assert
      expect(destination1, equals(destination2));
    });

    test('should have the same hash code for two equal Destination instances',
        () {
      // arrange
      final destination1 =
          Destination(name: 'Test', latitude: 1.0, longitude: 2.0);
      final destination2 =
          Destination(name: 'Test', latitude: 1.0, longitude: 2.0);

      // act/assert
      expect(destination1.hashCode, equals(destination2.hashCode));
    });

    test(
        'should not be equal to another Destination instance with different properties',
        () {
      // arrange
      final destination1 =
          Destination(name: 'Test', latitude: 1.0, longitude: 2.0);
      final destination2 =
          Destination(name: 'Different', latitude: 3.0, longitude: 4.0);

      // act/assert
      expect(destination1, isNot(equals(destination2)));
    });
  });
}

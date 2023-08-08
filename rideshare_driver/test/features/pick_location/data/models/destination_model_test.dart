import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/pick_location/data/models/destination_model.dart';

void main() {
  group('DestinationModel', () {
    test('fromJson should return a valid DestinationModel instance', () {
      // Arrange
      final json = {
        'latitude': 37.7749,
        'longitude': -122.4194,
        'name': 'San Francisco',
      };

      // Act
      final destination = DestinationModel.fromJson(json);

      // Assert
      expect(destination.latitude, equals(37.7749));
      expect(destination.longitude, equals(-122.4194));
      expect(destination.name, equals('San Francisco'));
    });
  });
}
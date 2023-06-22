import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/feed/data/models/destination_model.dart';

void main() {
  group('DestinationModel', () {
    const double testLatitude = 37.7749;
    const double testLongitude = -122.4194;
    const String testName = 'Test Destination';

    test('should create a DestinationModel instance', () {
      // Arrange
      final destinationModel = DestinationModel(
        latitude: testLatitude,
        longitude: testLongitude,
        name: testName,
      );

      // Assert
      expect(destinationModel, isA<DestinationModel>());
      expect(destinationModel.latitude, testLatitude);
      expect(destinationModel.longitude, testLongitude);
      expect(destinationModel.name, testName);
    });

    test('should convert a DestinationModel to JSON', () {
      // Arrange
      final destinationModel = DestinationModel(
        latitude: testLatitude,
        longitude: testLongitude,
        name: testName,
      );

      // Act
      final json = destinationModel.toJson();

      // Assert
      expect(json, isA<Map<String, dynamic>>());
      expect(json['latitude'], testLatitude);
      expect(json['longitude'], testLongitude);
      expect(json['name'], testName);
    });

    test('should create a DestinationModel instance from JSON', () {
      // Arrange
      final json = {
        'latitude': testLatitude,
        'longitude': testLongitude,
        'name': testName,
      };

      // Act
      final destinationModel = DestinationModel.fromJson(json);

      // Assert
      expect(destinationModel, isA<DestinationModel>());
      expect(destinationModel.latitude, testLatitude);
      expect(destinationModel.longitude, testLongitude);
      expect(destinationModel.name, testName);
    });
  });
}
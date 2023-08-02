import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/pick_location/data/models/destination_model.dart';

void main() {
  group('DestinationModel', () {
    test('should create a valid DestinationModel from JSON', () {
      // Arrange
      final jsonMap = {
        "latitude": 12.3456,
        "longitude": 78.9012,
        "name": "City 1",
      };

      // Act
      final model = DestinationModel.fromJson(jsonMap);

      // Assert
      expect(model, isA<DestinationModel>());
      expect(model.latitude, 12.3456);
      expect(model.longitude, 78.9012);
      expect(model.name, "City 1");
    });

    test('should create a JSON from DestinationModel', () {
      // Arrange
      final model = DestinationModel(
        latitude: 34.5678,
        longitude: 90.1234,
        name: "City 2",
      );

      // Act
      final jsonMap = model.toJson();

      // Assert
      expect(jsonMap, isA<Map<String, dynamic>>());
      expect(jsonMap["latitude"], 34.5678);
      expect(jsonMap["longitude"], 90.1234);
      expect(jsonMap["name"], "City 2");
    });
  });
}
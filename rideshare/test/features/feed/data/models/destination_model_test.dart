import 'package:rideshare/features/feed/data/models/destination_model.dart';
import 'package:test/test.dart';


void main() {
  group('DestinationModel', () {
    const String testName = 'Test Name';

    test('fromJson() should return a valid DestinationModel instance', () {
      // Arrange
      final Map<String, dynamic> json = {'name': testName};

      // Act
      final destination = DestinationModel.fromJson(json);

      // Assert
      expect(destination, isA<DestinationModel>());
      expect(destination.name, testName);
    });

    test('toJson() should return a valid JSON map', () {
      // Arrange
      final destination = DestinationModel(name: testName);

      // Act
      final json = destination.toJson();

      // Assert
      expect(json, isA<Map<String, dynamic>>());
      expect(json['name'], testName);
    });

    test('name should be set correctly in the DestinationModel', () {
      // Arrange
      final destination = DestinationModel(name: testName);

      // Act & Assert
      expect(destination.name, testName);
    });
  });
}
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/core/errors/exceptions.dart';
import 'package:rideshare/features/pick_location/data/datasources/destination_datasource.dart';
import 'package:rideshare/features/pick_location/data/models/destination_model.dart';

import 'destination_datasource_test.mocks.dart';

@GenerateMocks([DestinationDataSource, http.Client])

void main() {
  late DestinationDataSourceImp dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = DestinationDataSourceImp(client: mockHttpClient);
  });

  group('fetchPassengerHistory', () {
     const exampleJson = '''
      {
        "names": [
          {
            "name": "City A",
            "population": 1000000
          },
          {
            "name": "City B",
            "population": 500000
          }
        ]
      }
    ''';

    final expectedDestinations = [
      DestinationModel.fromJson({"name": "City A", "population": 1000000}),
      DestinationModel.fromJson({"name": "City B", "population": 500000}),
    ];

    test('should return a list of destinations when the request is successful', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(dataSource.url)))
          .thenAnswer((_) async => http.Response(exampleJson, 200));

      // Act
      final result = await dataSource.fetchPassengerHistory();

      // print(result);

      // Assert
      expect(result, expectedDestinations);
    });

    test('should throw a ServerException when the request fails', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(dataSource.url)))
          .thenAnswer((_) async => http.Response('Server Error', 500));

      // Act & Assert
      expect(() => dataSource.fetchPassengerHistory(), throwsA(isInstanceOf<ServerException>()));
    });
  });
}

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:rideshare/core/errors/exceptions.dart';
import 'package:rideshare/features/pick_location/data/datasources/destination_datasource.dart';
import 'package:rideshare/features/pick_location/domain/entities/destination.dart';
import 'destination_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late DestinationDataSourceImp dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = DestinationDataSourceImp(client: mockHttpClient);
  });

  group('fetchPassengerHistory', () {
    final tUrl = "https://mocki.io/v1/526a6616-b8af-42b6-be37-ec8148e10e1c";
final tResponse = jsonEncode({ 'names' :[
  {'name': 'City1', 'latitude': 12.9715987, 'longitude': 77.5945627},
  {'name': 'City2', 'latitude': 13.0826802, 'longitude': 80.2707184}
]});
    test('should perform a GET request', () async {
      // arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => http.Response(tResponse, 200));
      // act
      await dataSource.fetchPassengerHistory();
      // assert
      verify(mockHttpClient.get(Uri.parse(tUrl)));
    });

    test('should return a list of Destination when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => http.Response(tResponse, 200));
      // act
      final result = await dataSource.fetchPassengerHistory();
      // assert
      expect(result, isA<List<Destination>>());
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.fetchPassengerHistory;
      // assert
      expect(() => call(), throwsA(isA<ServerException>()));
    });
  });
}

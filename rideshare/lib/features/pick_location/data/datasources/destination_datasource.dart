import 'dart:convert';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/destination.dart';
import 'package:http/http.dart' as http;

import '../models/destination_model.dart';

/// Destination Data Source Interface
///
/// This interface defines the contract for fetching passenger history destinations from a data source,
/// which can be a remote API or local database.
abstract class DestinationDataSource {
  /// Fetches the history of destinations for a passenger.
  ///
  /// Returns a [List] of [Destination] representing the passenger's history destinations.
  ///
  /// Throws a [ServerException] if an error occurs during the data retrieval process.
  Future<List<Destination>> fetchPassengerHistory();
}

/// Destination Data Source Implementation
///
/// This class implements the [DestinationDataSource] interface and is responsible for
/// fetching passenger history destinations from a remote API using HTTP.
class DestinationDataSourceImp implements DestinationDataSource {
  /// HTTP client for making network requests.
  final http.Client client;

  /// URL for the API endpoint.
  String url = 'https://mocki.io/v1/526a6616-b8af-42b6-be37-ec8148e10e1c';

  /// Constructor for [DestinationDataSourceImp].
  ///
  /// Requires an instance of [http.Client].
  DestinationDataSourceImp({required this.client});

  /// Fetches the history of destinations for a passenger.
  ///
  /// Returns a [List] of [Destination] representing the passenger's history destinations.
  ///
  /// Throws a [ServerException] if the data retrieval process encounters an error.
  @override
  Future<List<Destination>> fetchPassengerHistory() async {
    try {
      final response = await client.get(Uri.parse(url));

      final jsonMap = json.decode(response.body);

      final citiesList = jsonMap["names"];
      List<Destination> list = [];
      for (final city in citiesList) {
        list.add(DestinationModel.fromJson(city));
      }
      return list;
    } on Exception catch (_, e) {
      throw ServerException("server exception");
    }
  }
}

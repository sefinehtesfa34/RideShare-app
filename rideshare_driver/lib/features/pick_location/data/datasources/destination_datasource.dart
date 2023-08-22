import 'dart:convert';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/destination.dart';
import 'package:http/http.dart' as http;

import '../models/destination_model.dart';

abstract class DestinationDataSource {
  Future<List<Destination>> fetchPassengerHistory();
}

class DestinationDataSourceImp implements DestinationDataSource {
  final http.Client client;
  String url = "https://mocki.io/v1/526a6616-b8af-42b6-be37-ec8148e10e1c";

  DestinationDataSourceImp({required this.client});

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
    } on Exception catch (_,e) {
      throw ServerException("server exception");
    }
  }
}

/**
 * `destination_datasource.dart`
 * 
 * This file contains the `DestinationDataSource` abstract class and its implementation `DestinationDataSourceImp`.
 * 
 * Classes:
 * `DestinationDataSource`: An abstract class that defines the contract for a data source that fetches passenger history.
 * `DestinationDataSourceImp`: An implementation of the `DestinationDataSource` abstract class.
 * 
 * The `DestinationDataSourceImp` class has the following properties:
 * `client`: An instance of `http.Client` which is used to make network requests.
 * `url`: The URL of the API endpoint.
 * 
 * The `DestinationDataSourceImp` class has the following methods:
 * `fetchPassengerHistory`: This method makes a GET request to the API endpoint, parses the JSON response,
 * and returns a list of `Destination` objects. It throws a `ServerException` if there is any error during the network request.
 * 
 * Usage:
 * 
 * ```dart
 * final client = http.Client();
 * final destinationDataSource = DestinationDataSourceImp(client: client);
 * final passengerHistory = await destinationDataSource.fetchPassengerHistory();
 * ```
 */
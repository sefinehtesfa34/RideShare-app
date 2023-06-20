import 'dart:convert';
import '../../../../core/errors/exception.dart';
import '../../domain/entities/destination.dart';
import 'package:http/http.dart' as http;

abstract class DestinationDataSource {
  Future<List<Destination>> fetchPassengerHistory();
  Future<List<Destination>> fetchPopularDestinations();
}

class DestinationDataSourceImp extends DestinationDataSource {
  final http.Client client;
  DestinationDataSourceImp({required this.client});

  @override
  Future<List<Destination>> fetchPassengerHistory() async {
    final url =
        'apiKey';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);

      return List<Destination>.from(jsonMap['data']);

    } else {

      throw ServerException("Unable to fetch History");
    }
  }

  @override
  Future<List<Destination>> fetchPopularDestinations() async {
  final url =
          'apiKey';
      final response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonMap = json.decode(response.body);

        return List<Destination>.from(jsonMap['data']);

      } else {

        throw ServerException("Unable to fetch popular destinations");
      }
  }
}

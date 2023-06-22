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
  String url = 'https://mocki.io/v1/f3dd3cd0-09d3-46ad-85f7-b9862e3ac787';

  DestinationDataSourceImp({required this.client});

  @override
  Future<List<Destination>> fetchPassengerHistory() async {
    try {
      final response = await client.get(Uri.parse(url));

      final jsonMap = json.decode(response.body);

      final citiesList = jsonMap["names"];
      // print(citiesList);
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

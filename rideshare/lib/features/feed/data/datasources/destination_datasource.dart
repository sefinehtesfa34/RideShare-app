import 'dart:convert';
import '../../../../core/errors/exception.dart';
import '../../domain/entities/destination.dart';
import 'package:http/http.dart' as http;

import '../models/destination_model.dart';

abstract class DestinationDataSource {
  Future<List<Destination>> fetchPassengerHistory();
}

class DestinationDataSourceImp implements DestinationDataSource {
  final http.Client client;
  String url = 'https://mocki.io/v1/a72e8fae-c302-47ff-bd4f-1d5c7e32df58';

  DestinationDataSourceImp({required this.client});

  @override
  Future<List<DestinationModel>> fetchPassengerHistory() async {
    try {
      final response = await client.get(Uri.parse(url));
      final jsonMap = json.decode(response.body);

      return List<DestinationModel>.from(jsonMap);
    } on Exception catch (_, e) {
      throw ServerException("server exception");
    }
  }
}

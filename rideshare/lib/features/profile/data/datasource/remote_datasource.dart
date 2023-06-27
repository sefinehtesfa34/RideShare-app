import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../../domain/entity/passenger.dart';
import '../model/passenger_model.dart';

abstract class PassengerRemoteDataSource {
  Future<Passenger> updateData({String? fullName, int? age});
  Future<Passenger> getData();
}

class PassengerRemoteDataSourceImpl extends PassengerRemoteDataSource {
  final http.Client client;
  PassengerRemoteDataSourceImpl({required this.client});
  @override
  Future<Passenger> updateData({String? fullName, int? age}) async {
    const String api = '';
    try {
      final http.Response response = await http.post(Uri.parse(api));
      if (response.statusCode == 200) {
        return PassengerModel.fromJson(jsonDecode(response.body));
      }
      throw ServerException('message');
    } catch (e) {
      throw ServerException('message');
    }
  }

  @override
  Future<Passenger> getData() async {
    const String api = 'https://mocki.io/v1/490d1694-e71d-4783-ac97-6776346709ee';
    try {
      final http.Response response = await http.get(Uri.parse(api));
      return PassengerModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw ServerException;
    }
  }
}

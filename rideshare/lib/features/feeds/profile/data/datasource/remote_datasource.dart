import 'dart:convert';

import 'package:rideshare/core/errors/exception.dart';
import 'package:rideshare/features/feeds/profile/data/model/passenger_model.dart';
import 'package:rideshare/features/feeds/profile/domain/entity/passenger.dart';
import 'package:http/http.dart' as http;

abstract class PassengerRemoteDataSource {
  Future<Passenger> updateData({String? fullName, int? age});
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
}

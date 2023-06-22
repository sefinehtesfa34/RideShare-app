import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rideshare/core/errors/exceptions.dart';

abstract class UserDataSource {
  Future<String> verifyOtp(String phoneNumber, String otp);
}

class UserDataSourceImpl implements UserDataSource {
  final http.Client client;

  UserDataSourceImpl({required this.client});

  static const String baseUrl =
      'https://mocki.io/v1/84d8583b-2f46-48ce-8c5d-235fbfa51605';

  @override
  Future<String> verifyOtp(String phoneNumber, String otp) async {
    try {
      final http.Response response = await client.get(Uri.parse(baseUrl));
      return jsonDecode(response.body)['otp'];
    } catch (e) {
      throw ServerException('Server failure');
    }
  }
}

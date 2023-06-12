import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rideshare/core/errors/exceptions.dart';

abstract class UserDataSource {
  Future<bool> verifyOtp(String phoneNumber, String otp);
}

class UserDataSourceImpl implements UserDataSource {
  final http.Client client;

  UserDataSourceImpl({required this.client});

  static const String baseUrl = 'https://your-api.com';

  @override
  Future<bool> verifyOtp(String phoneNumber, String otp) async {
    try {
      final http.Response response = await client.get(Uri.parse('$baseUrl/verify/?otp=$otp'));
      return jsonDecode(response.body);
    } catch (e) {
      throw ServerException('Server failure');
    }
  }
}

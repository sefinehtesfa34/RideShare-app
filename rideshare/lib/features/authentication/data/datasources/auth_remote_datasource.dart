import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rideshare/core/errors/exceptions.dart';
import 'package:rideshare/features/authentication/data/models/signup_model.dart';
import 'package:rideshare/features/profile/data/model/passenger_model.dart';
import 'package:rideshare/features/profile/domain/entity/passenger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/signup_payload.dart';
import '../../presentation/bloc/firebase/bloc/firebase_bloc.dart';

abstract class AuthRemoteDataSource {
  Future<VerifyOtpModel> verifyOtp(String phoneNumber);
  Future<SignupPayloadModel> signup(SignupPayload model);
  Future<String> login(String phoneNumber);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  static const String baseUrl =
      'https://mocki.io/v1/bf3b82cf-101b-4d86-9082-9fd3e722ab99';
  static const String secondBaseUrl =
      'https://mocki.io/v1/b7b78c0a-6bcf-458c-8d0e-da8a4856ce34';

  AuthRemoteDataSourceImpl({required this.client});
  @override
  Future<VerifyOtpModel> verifyOtp(String phoneNumber) async {
    try {
      final http.Response response = await http.get(Uri.parse(baseUrl));
      return VerifyOtpModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw ServerException('Server failure');
    }
  }

  @override
  Future<SignupPayloadModel> signup(SignupPayload model) async {
    final SignupPayloadModel newModel = SignupPayloadModel(
      fullName: model.fullName,
      age: model.age,
      imageUrl: model.imageUrl,
    );
    final Map<String, dynamic> jsonBody = newModel.toJson();
    final http.Response response = await client.post(
      Uri.parse(baseUrl),
      body: json.encode(jsonBody),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return SignupPayloadModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw ServerException('Server failure');
    }
  }

  @override
  Future<String> login(String phoneNumber) async {
    const String api =
        'https://mocki.io/v1/0ceb4034-dca4-4c71-8d09-44aac1fee13c';
    try {
      final http.Response response = await client.get(Uri.parse(api));
      if (response.statusCode == 200) {
        const String fetchUrl =
            'https://mocki.io/v1/a015cd7a-c144-46b6-acd2-a6c1539e4ec2';
        final http.Response response = await http.get(Uri.parse(fetchUrl));
        if (response.statusCode == 200) {
          SharedPreferences sharedPreferences =
              await cacheManager.sharedPreferences;
          sharedPreferences.setString(phoneNumber, jsonEncode(response.body));
        }
      }
      return jsonDecode(response.body)['code'];
    } catch (e) {
      throw ServerException;
    }
  }
}

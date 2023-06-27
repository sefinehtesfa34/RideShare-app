import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rideshare/core/errors/exceptions.dart';
import 'package:rideshare/features/authentication/data/models/signup_model.dart';
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
  static const String baseUrl = 'https://rideshare-app.onrender.com/api/User';
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
    SharedPreferences sharedPreferences = await cacheManager.sharedPreferences;
    final SignupPayloadModel newModel = SignupPayloadModel(
        id: model.id,
        name: model.name,
        fullName: model.fullName,
        age: model.age,
        imageId: model.imageId,
        phoneNumber: sharedPreferences.getString('PHONE_NUMBER') ??
            'Phone number is not provided');
    print(newModel);
    final Map<String, dynamic> jsonBody = newModel.toJson();
    try {
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
    } catch (e) {
      throw ServerException;
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
        final http.Response response = await client.get(Uri.parse(fetchUrl));
        if (response.statusCode == 200) {
          SharedPreferences sharedPreferences =
              await cacheManager.sharedPreferences;
          sharedPreferences.setString(phoneNumber, jsonEncode(response.body));
          sharedPreferences.setString('PHONE_NUMBER', phoneNumber);
          
        }
      }
      return jsonDecode(response.body)['code'];
    } catch (e) {
      throw ServerException;
    }
  }
}

import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

import '../../../../core/errors/exception.dart';
import '../model/auth_login_model.dart';
import '../model/auth_signup_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<AuthLoginModel> login(phoneNumber);
  Future<AuthSignupModel> signup(age, phoneNumber, fullName, sex, id);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final baseUrl = 'https://mocki.io/v1/a1c63369-aaee-437c-a86a-ee544f50268a';
  final http.Client client;

  AuthenticationRemoteDataSourceImpl(this.client);

  @override
  Future<AuthLoginModel> login(phoneNumber) async {
    try {
      var response = await client.post(Uri.parse(baseUrl));

      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      return AuthLoginModel.fromJson(decodedResponse);
    } on Exception catch (_, e) {
      throw ServerException("something went wrong");
    }
  }
  
  @override
  Future<AuthSignupModel> signup(age, phoneNumber, fullName, sex, id) async {
   try {
      var response = await client.post(Uri.parse(baseUrl));

      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      return AuthSignupModel.fromJson(decodedResponse);
    } on Exception catch (_, e) {
      throw ServerException("something went wrong");
    }
  }
}

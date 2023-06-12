import 'dart:convert';

import '../../../../core/errors/exception.dart';
import '../model/auth_login_model.dart';
import 'package:http/http.dart' as http;

import '../model/auth_signup_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<AuthLoginModel> login(phoneNumber);
  Future<AuthSignupModel> signup(age, phoneNumber, fullName, sex, id);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final baseloginUrl = 'https://mocki.io/v1/11c526c6-d1fe-487c-8708-c46d30aa78ec';
  final basesignupUrl = 'https://mocki.io/v1/11c526c6-d1fe-487c-8708-c46d30aa78ec';

  final http.Client client;

  AuthenticationRemoteDataSourceImpl(this.client);

  @override
  Future<AuthLoginModel> login(phoneNumber) async {
    try {
      var response = await client.post(Uri.parse(baseloginUrl));

      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      return AuthLoginModel.fromJson(decodedResponse);
    } on Exception catch (_, e) {
      throw ServerException("wrong login");
    }
  }


   @override
  Future<AuthSignupModel> signup(age, phoneNumber, fullName, sex, id) async {
    try {
      var response = await client.post(Uri.parse(basesignupUrl));

      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      return AuthSignupModel.fromJson(decodedResponse);
    } on Exception catch (_, e) {
      throw ServerException("wrong login");
    }
  }
}

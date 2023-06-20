import 'dart:convert';

import '../../../../core/error/exception.dart';
import '../model/auth_login_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSource {
  Future<AuthLoginModel> login(phoneNumber);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final http.Client client;
  final String baseloginUrl =
      'https://mocki.io/v1/11c526c6-d1fe-487c-8708-c46d30aa78ec';

  AuthenticationRemoteDataSourceImpl({required this.client});

  @override
  Future<AuthLoginModel> login(phoneNumber) async {
    try {
      http.Response response = await client.post(Uri.parse(baseloginUrl));

      Map<String, dynamic> decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      
      return AuthLoginModel.fromJson(decodedResponse);
    } on Exception catch (_, e) {
      throw ServerException();
    }
  }

  // @override
  // Future<AuthSignupModel> signup(age, phoneNumber, fullName, sex, id) async {
  //   try {
  //     var response = await client.post(Uri.parse(basesignupUrl));

  //     var decodedResponse =
  //         jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

  //     return AuthSignupModel.fromJson(decodedResponse);
  //   } on Exception catch (_, e) {
  //     throw ServerException("wrong login");
  //   }
  // }
}

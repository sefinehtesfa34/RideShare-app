import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:rideshare/features/authentication/data/model/auth_login_model.dart';
import 'package:rideshare/features/authentication/domain/entities/login_payload.dart';

import '../../../../core/fixture/user_cred_reader.dart';

void main() {

  const testUserData =
      AuthLoginModel( phoneNumber: "test");
  test("AuthLoginModel should be type of LoginPayload", () {
    expect(testUserData, isA<LoginPayload>());
  });

  test(
      "The static formjson function should return UserAuthCredentialModel instance",
      () {
    final generated = AuthLoginModel.fromJson(
        json.decode(fixture("user_cred.json")));

    expect(generated, testUserData);
  });

  test("toJson function should reture the instance in json format", () {
    final resultJson = testUserData.toJson();

    expect(resultJson, json.decode(fixture("user_cred.json")) );
  });
  }
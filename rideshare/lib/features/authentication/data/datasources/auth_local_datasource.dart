import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesDataSource {
  Future<bool> isLoggedIn(String keyPhoneNumber);
  Future<void> setLoggedIn(String phoneNumber, bool isLoggedIn);
}

class SharedPreferencesDataSourceImpl implements SharedPreferencesDataSource {
  final SharedPreferences sharedPreferences;

  SharedPreferencesDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> isLoggedIn(String phoneNumber) async {
    return sharedPreferences.getBool(phoneNumber) ?? false;
  }

  @override
  Future<void> setLoggedIn(String phoneNumber, bool isLoggedIn) async {
    await sharedPreferences.setBool(phoneNumber, isLoggedIn);
  }
}

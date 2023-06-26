import 'package:rideshare/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesDataSource {
  Future<bool> isLoggedIn();
  Future<void> setLoggedIn(bool isLoggedIn);
}

class SharedPreferencesDataSourceImpl implements SharedPreferencesDataSource {
  final SharedPreferences sharedPreferences;
  static const String keyPhoneNumber = '_KEY_PHONE_NUMBER';
  SharedPreferencesDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> isLoggedIn() async {
    try {
      final bool? response = sharedPreferences.getBool(keyPhoneNumber);
      if (response != null && response) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw CacheException;
    }
  }

  @override
  Future<void> setLoggedIn(bool isLoggedIn) async {
    await sharedPreferences.setBool(keyPhoneNumber, isLoggedIn);
  }
}
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesDataSource {
  Future<bool> isLoggedIn();
  Future<void> setLoggedIn(bool isLoggedIn);
}

class SharedPreferencesDataSourceImpl implements SharedPreferencesDataSource {
  final SharedPreferences sharedPreferences;
  static const String keyPhoneNumber = '_KEY_PHONE_NUMBER';
  SharedPreferencesDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> isLoggedIn() async {
    try {
      final bool? response = sharedPreferences.getBool(keyPhoneNumber);
      if (response != null && response) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw CacheException;
    }
  }

  @override
  Future<void> setLoggedIn(bool isLoggedIn) async {
    await sharedPreferences.setBool(keyPhoneNumber, isLoggedIn);
  }
}

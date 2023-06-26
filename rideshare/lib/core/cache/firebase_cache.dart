import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  final Future<SharedPreferences> sharedPreferencesFuture;

  CacheManager({required this.sharedPreferencesFuture});

  Future<SharedPreferences> get sharedPreferences async {
    return sharedPreferencesFuture;
  }
}

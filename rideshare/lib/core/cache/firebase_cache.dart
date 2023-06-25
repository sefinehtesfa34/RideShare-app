import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  final Future<SharedPreferences> sharedPreferencesFuture;
  SharedPreferences? sharedPreferencesInstance;

  CacheManager({required this.sharedPreferencesFuture});

  Future<SharedPreferences> get sharedPreferences async {
    if (sharedPreferencesInstance != null) {
      return sharedPreferencesInstance!;
    } else {
      sharedPreferencesInstance = await sharedPreferencesFuture;
      return sharedPreferencesInstance!;
    }
  }
}

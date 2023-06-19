import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rideshare/constants/api.dart';

Future<String> getCity(double latitude, double longitude) async {
  try {
    final http.Client client = http.Client();
    final http.Response response = await client.get(Uri.parse(
        '$cityApi?latitude=$latitude&longitude=$longitude&localityLanguage=en'));
    // ignore: always_specify_types
    final data = jsonDecode(response.body);

    String principalSubdivision = data['principalSubdivision'];
    String principalSubdivisionCode = data['principalSubdivisionCode'];
    String locality = data['locality'];
    String continent = data['continent'];

    String cityName = data['city'];
    String countryName = data['countryName'];
    return '$continent, $countryName, $cityName, $principalSubdivision, $principalSubdivisionCode, $locality';
  } catch (e) {
    return 'Server Failed Latlng($latitude $longitude)';
  }
}

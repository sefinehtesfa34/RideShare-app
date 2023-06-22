import 'package:http/http.dart' as http;
import 'dart:convert';

import '../core/map/map_box.dart';

const String token =
    "pk.eyJ1Ijoic2VmaW5laCIsImEiOiJjbGl5OHo1eW8wZnJyM2VvMTNpd3p4dmVrIn0.IleP_dW8G2s7u0Hn06ToNg";
const String api = "https://api.mapbox.com/geocoding/v5/mapbox.places/Addis";
const String cityApi =
    'https://api.bigdatacloud.net/data/reverse-geocode-client';

// parameter  ?latitude=37.42159&longitude=-122.0837&localityLanguage=en

Future<String> getAddressFromCoordinates(
    double latitude, double longitude, String mapBoxAccessToken) async {
  final String accessToken =
      mapBoxAccessToken; // replace with your Mapbox access token
  final String apiUrl =
      'https://api.mapbox.com/geocoding/v5/mapbox.places/$longitude,$latitude.json?access_token=$accessToken';

  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json["features"[0]]);
      final String shortCode = json['features'][0]['id'];
      final String formattedCode = shortCode.replaceAll('-', '+');
      return formattedCode;
    } else {
      return "Failed to fetch Address";
    }
  } catch (e) {
    return "Failed to fetch Address";
  }
}

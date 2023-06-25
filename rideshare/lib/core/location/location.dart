import 'package:geolocator/geolocator.dart';

Future<Position?> getLocationTemp() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return position;
  } catch (e) {
    return null;
  }
}

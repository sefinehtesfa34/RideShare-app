import 'package:geolocator/geolocator.dart';

Future<Position?> getLocationTemp() async {
  try {
    print("been here");
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return position;
  } catch (e) {
    print(e);
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rideshare/core/utils/colors.dart';

class MapPicker extends StatefulWidget {
  final TextEditingController controller;

  const MapPicker({Key? key, required this.controller}) : super(key: key);

  @override
  _MapPickerState createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker> {
  late GoogleMapController _mapController;
  LatLng initialPos = const LatLng(37.7749, -122.4194);
  Marker _positionMarker = const Marker(
    markerId: MarkerId("selected-location"),
    position: LatLng(37.7749, -122.4194),
  );
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: initialPos,
          zoom: 12.0,
        ),
        markers: {_positionMarker},
        onCameraMove: (position) {
          setState(() {
            _positionMarker =
                _positionMarker.copyWith(positionParam: position.target);
          });
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () async {
              final pos = _positionMarker.position;
              List<Placemark> placemarks =
                  await placemarkFromCoordinates(pos.latitude, pos.longitude);
              setState(() {
                widget.controller.text = placemarks[0].street!;
              });
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.check,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}

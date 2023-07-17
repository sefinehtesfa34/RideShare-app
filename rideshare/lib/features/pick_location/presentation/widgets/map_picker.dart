import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rideshare/core/utils/colors.dart';

class MapPicker extends StatefulWidget {
  final TextEditingController controller;
  final LatLng intialLocation;
  const MapPicker({
    Key? key,
    required this.controller,
    required this.intialLocation,
  }) : super(key: key);

  @override
  _MapPickerState createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker> {
  late GoogleMapController _mapController;
  late Marker _positionMarker;
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _positionMarker = Marker(
      markerId: MarkerId("selected-location"),
      position: LatLng(
        widget.intialLocation.latitude,
        widget.intialLocation.longitude,
      ),
    );
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
          target: LatLng(9.030098, 38.762868),
          zoom: 16.0,
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
              Navigator.pop(
                  context,
                  LatLng(
                    pos.latitude,
                    pos.longitude,
                  ));
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

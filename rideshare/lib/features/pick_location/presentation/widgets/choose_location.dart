import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';

class SearchDestinationPage extends StatefulWidget {
  final GoogleMapsPlaces places;
  const SearchDestinationPage({Key? key, required this.places})
      : super(key: key);
  @override
  _SearchDestinationPageState createState() => _SearchDestinationPageState();
}

class _SearchDestinationPageState extends State<SearchDestinationPage> {
  String _searchTerm = '';
  List<Prediction> _predictions = [];
  Future<List<Prediction>> _getPlacePredictions(String searchTerm) async {
    PlacesAutocompleteResponse response = await widget.places.autocomplete(
      searchTerm,
      // This field is optional but recommended. It is used to group autocomplete requests into sessions, which can help improve billing and tracking.
      types: ['geocode'],
      components: [
        Component(Component.country, 'et')
      ], // Limit suggestions to Ethiopia
    );
    if (response.isOkay) {
      return response.predictions;
    } else {
      throw Exception('Failed to load place predictions!');
    }
  }

  void _onSearchTextChanged(String value) async {
    setState(() {
      _searchTerm = value;
    });
    if (_searchTerm.isNotEmpty) {
      List<Prediction> predictions = await _getPlacePredictions(_searchTerm);
      setState(() {
        _predictions = predictions;
      });
    } else {
      setState(() {
        _predictions = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Destination'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: _onSearchTextChanged,
              decoration: InputDecoration(
                hintText: 'Enter destination',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _predictions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_predictions[index].description!),
                  onTap: () {
                    // Do something with the selected address
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

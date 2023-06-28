import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/colors.dart';

import '../bloc/passenger_home_bloc.dart';
import 'confirm_dialog.dart';
import 'map_picker.dart';
import 'where_button.dart';

class ChooseLocation extends StatefulWidget {
  final GoogleMapsPlaces places;

  const ChooseLocation({
    Key? key,
    required this.places,
  }) : super(key: key);
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  String _searchTerm = '';

  List<Prediction> _predictions = [];
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  FocusNode _sourceFocusNode = FocusNode();
  FocusNode _destinationFocusNode = FocusNode();
  LatLng? _sourceLocation;
  LatLng? _destinationLocation;
  final _formKey = GlobalKey<FormState>();
  int seatCount = 1;
  bool _sourceSelected = true;

  Future<List<Prediction>> _getPlacePredictions(String searchTerm) async {
    PlacesAutocompleteResponse response = await widget.places.autocomplete(
      searchTerm,
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
  void initState() {
    super.initState();
    _sourceFocusNode.addListener(() {
      if (_sourceFocusNode.hasFocus) {
        setState(() {
          _sourceSelected = true;
        });
      }
    });
    _destinationFocusNode.addListener(() {
      if (_destinationFocusNode.hasFocus) {
        setState(() {
          _sourceSelected = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChooseLocationsBloc, ChooseLocationsState>(
      listener: (context, state) {
        if (state is ChooseLocationsSucess) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SeatSelectionDialog(
                source: state.sourceName,
                destination: state.destinationName,
                seatCount: seatCount,
                onSeatCountChanged: (int count) {
                  setState(() {
                    seatCount = count;
                  });
                },
                onConfirmPressed: () {},
              );
            },
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Enter Destination',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 2.0.w, right: 4.0.w, top: 4.h),
                    child: Row(
                      children: [
                        Image(
                          image:
                              const AssetImage("assets/images/circle_icon.jpg"),
                          width: 7.w,
                        ),
                        Expanded(
                          child: TextFormField(
                            onChanged: _onSearchTextChanged,
                            controller: _sourceController,
                            focusNode: _sourceFocusNode,
                            decoration: decoration("Enter source location"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a source location';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 2.0.w, right: 4.0.w, top: 3.h),
                    child: Row(
                      children: [
                        Image(
                          image: const AssetImage("assets/images/location.png"),
                          width: 7.w,
                        ),
                        Expanded(
                          child: TextFormField(
                            onChanged: _onSearchTextChanged,
                            controller: _destinationController,
                            focusNode: _destinationFocusNode,
                            decoration:
                                decoration("Enter destination location"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a destination location';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.0.w, right: 4.0.w, top: 3.h),
              child: Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(
                  vertical: 3.w,
                  horizontal: 4.w,
                ),
                width: 87.w,
                child: BlocBuilder<ChooseLocationsBloc, ChooseLocationsState>(
                  builder: (context, state) {
                    return state is ChooseLocationsLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: white,
                            ),
                          )
                        : InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<ChooseLocationsBloc>(context)
                                    .add(SelectecLocationsEvent(
                                  _sourceController.text,
                                  _destinationController.text,
                                  _sourceLocation,
                                  _destinationLocation,
                                ));
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Confirm",
                                  style: TextStyle(
                                    fontSize: 16.5.sp,
                                    fontFamily: "Poppins",
                                    color: white,
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                const Icon(
                                  Icons.directions,
                                  color: white,
                                  size: 25,
                                ),
                              ],
                            ));
                  },
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const Divider(),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: ListView.builder(
                  itemCount: _predictions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image(
                        image: const AssetImage("assets/images/location.png"),
                        width: 7.w,
                      ),
                      title: Text(
                        _predictions[index].description!,
                        style: TextStyle(
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                        ),
                      ),
                      subtitle: Text(
                        _predictions[index].description!,
                        style: TextStyle(
                          fontSize: 14.0.sp,
                          fontFamily: "Poppins",
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (_sourceFocusNode.hasFocus) {
                            _sourceController.text =
                                _predictions[index].description!;
                            _predictions = [];
                          }
                          if (_destinationFocusNode.hasFocus) {
                            _destinationController.text =
                                _predictions[index].description!;
                            _predictions = [];
                          }
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 12.0.w, right: 4.0.w, top: 3.h),
          child: CustomButton(
              text: "Choose Location on Map",
              onTap: () async {
                final CurrentLocationBloc bloc =
                    BlocProvider.of<CurrentLocationBloc>(context,
                        listen: false);
                final CurrentLocationState state = bloc.state;
                if (state is CurrentLocationSuccess) {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapPicker(
                        controller: _destinationFocusNode.hasFocus
                            ? _destinationController
                            : _sourceController,
                        intialLocation: state.location,
                      ),
                    ),
                  );

                  if (!_sourceSelected) {
                    _destinationLocation = result;
                  } else {
                    _sourceLocation = result;
                  }
                }
              }),
        ),
      ),
    );
  }
}

InputDecoration decoration(String hintText) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none,
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none,
    ),
    fillColor: const Color(0XFFE5E3F2),
    filled: true,
    border: const OutlineInputBorder(),
    hintText: hintText,
    hintStyle: TextStyle(
      color: const Color(0XFFA0A0A0),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
    ),
  );
}

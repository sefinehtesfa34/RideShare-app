part of 'location_bloc.dart';
class LocationState {
  final String source;
  final String destination;

  LocationState({this.source = '', this.destination = ''});

  LocationState copyWith({String? source, String? destination}) {
    return LocationState(
      source: source ?? this.source,
      destination: destination ?? this.destination,
    );
  }
}
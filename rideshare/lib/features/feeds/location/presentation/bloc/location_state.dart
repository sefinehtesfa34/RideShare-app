part of 'location_bloc.dart';

class LocationState {
  final String source;
  final String destination;
  final bool isLoading;
  final bool isSuccess;

  LocationState({
    this.source = '',
    this.destination = '',
    this.isLoading = false,
    this.isSuccess = false,
  });

  LocationState copyWith({
    String? source,
    String? destination,
    bool? isSuccess,
    bool? isLoading,
  }) {
    return LocationState(
      source: source ?? this.source,
      destination: destination ?? this.destination,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

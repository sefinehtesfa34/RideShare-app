part of 'location_bloc.dart';

class LocationState {
  final double sourceLatitude;
  final double sourceLongitude;
  final double destinationLatitude;
  final double destinationLongitude;

  final bool isLoading;
  final bool isSuccess;
  final bool failed;

  LocationState({
    this.destinationLatitude = 0,
    this.destinationLongitude = 0,
    this.sourceLatitude = 0,
    this.sourceLongitude = 0,
    this.isLoading = false,
    this.isSuccess = false,
    this.failed = false,
  });

  LocationState copyWith({
    double?sourceLatitude,
    double?sourceLongitude,
    double?destinationLatitude,
    double?destinationLongitude,
    bool? isSuccess,
    bool? isLoading,
    bool? failed,
  }) {
    return LocationState(
      sourceLatitude: sourceLatitude??this.sourceLatitude,
      destinationLatitude: destinationLatitude??this.destinationLatitude,
      sourceLongitude: sourceLongitude??this.sourceLongitude,
      destinationLongitude: destinationLongitude??this.destinationLongitude,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      failed: failed ?? this.failed,
    );
  }
}

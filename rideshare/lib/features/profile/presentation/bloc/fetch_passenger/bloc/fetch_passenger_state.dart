part of 'fetch_passenger_bloc.dart';

abstract class FetchPassengerState extends Equatable {
  const FetchPassengerState();

  @override
  List<Object> get props => [];
}

class FetchPassengerInitialState extends FetchPassengerState {}

class FetchPassengerLoadingState extends FetchPassengerState {}

class FetchPassengerSuccessState extends FetchPassengerState {
  final String phoneNumber;
  final String fullName;
  final int age;
  const FetchPassengerSuccessState({
    required this.age,
    required this.fullName,
    required this.phoneNumber,
  });
}

class FetchPassengerFailureState extends FetchPassengerState {}

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/profile/domain/entity/passenger.dart';
import 'package:rideshare/features/profile/domain/usecase/passenger_usecase.dart';

part 'fetch_passenger_event.dart';
part 'fetch_passenger_state.dart';

class FetchPassengerBloc
    extends Bloc<FetchPassengerEvent, FetchPassengerState> {
  final GetPassengerUsecase usecase;
  FetchPassengerBloc({required this.usecase})
      : super(FetchPassengerInitialState()) {
    on<FetchPassengerEvent>(
        (FetchPassengerEvent event, Emitter<FetchPassengerState> emit) async {
      emit(FetchPassengerLoadingState());
      Future<dynamic>.delayed(const Duration(seconds: 2));

      final Either<Failure, Passenger> passengerOrFailure =
          await usecase.call(null);
      passengerOrFailure.fold(
          (Failure failure) => emit(FetchPassengerFailureState()),
          (Passenger passenger) => emit(FetchPassengerSuccessState(
                age: passenger.age!,
                fullName: passenger.fullName!,
                phoneNumber: passenger.phoneNumber!,
              )));
      emit(FetchPassengerFailureState());
    });
  }
}

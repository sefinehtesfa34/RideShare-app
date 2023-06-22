import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/destination.dart';
import '../../domain/usecases/destination_usecase.dart';
part 'passenger_home_event.dart';
part 'passenger_home_state.dart';

class SlidingContainerBloc
    extends Bloc<SlidingContainerEvent, SlidingContainerState> {
  SlidingContainerBloc() : super(SearchDriverContainerVisibleState()) {
    on<CancelEvent>(_onCancel);
    on<ConfirmEvent>(_onConfirm);
  }


  void _onCancel(CancelEvent event, Emitter<SlidingContainerState> emit) {
    emit(SearchDriverContainerHiddenState());
  }


  void _onConfirm(ConfirmEvent event, Emitter<SlidingContainerState> emit) {
    if (state is SearchDriverContainerVisibleState) {
      emit(SearchDriverContainerHiddenState());
    } else if (state is SearchDriverContainerHiddenState) {
      emit(SearchDriverContainerVisibleState());
    }
  }
}

class NamesBloc extends Bloc<NamesEvent, NamesState> {
  final FetchPassengerHistoryUseCase fetchPassengerHistoryUseCase;


  NamesBloc({required this.fetchPassengerHistoryUseCase}) : super(NamesInitial()) {
    on<NamesEvent>(_onNameFetch);
  }

  void _onNameFetch(
      NamesEvent event, Emitter<NamesState> emit) async {
    emit(NamesLoading());

    final failureOrList = await fetchPassengerHistoryUseCase();
    emit(_errorOrNamesList(failureOrList));
  }

  NamesState _errorOrNamesList(
      Either<Failure, List<Destination>> failureOrNamesList) {
    return failureOrNamesList.fold(
      (failure) =>  NamesError("$failure"),
      (names) => NamesLoaded(names),
    );
  }
}

  // @override
  // on<NamesState>((event,emit) {};)

  // @override
  // on<FetchNamesEvent>((event, emit) {
  //   // TODO: implement event handler
  // });
  
 
  
  // }

  //   _mapFetchNamesEventToState() async{

    // try {
    //   final response = await http.get(Uri.parse(
    //       'https://mocki.io/v1/a72e8fae-c302-47ff-bd4f-1d5c7e32df58'));

    //   if (response.statusCode == 200) {
    //     final data = jsonDecode(response.body);
    //     final names = List<String>.from(data['names']);
    //     emit(NamesLoaded(names));

    //   } else {
    //     emit(NamesError('Failed to fetch names'));
    //   }
      
    // } catch (error) {
    //   emit(NamesError('An error occurred'));
    // }
//   }
// }

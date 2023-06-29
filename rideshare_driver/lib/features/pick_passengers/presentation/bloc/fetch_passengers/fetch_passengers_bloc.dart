import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entity/ride_offer.dart';
import '../../../domain/entity/ride_request.dart';
import '../../../domain/usecase/get_ride_offers_usecase.dart';

part 'fetch_passengers_event.dart';
part 'fetch_passengers_state.dart';

class FetchPassengersBloc
    extends Bloc<FetchPassengersEvent, FetchPassengersState> {
  GetRideOffersUseCase getOffersUseCase;

  FetchPassengersBloc(this.getOffersUseCase) : super(FetchPassengersInitial()) {
    on<FetchAllPassengers>(_onFetchPassengers);
  }

  _onFetchPassengers(
      FetchAllPassengers event, Emitter<FetchPassengersState> emit) async {
    emit(FetchPassengersLoading());
    print("fetch loading...");
    final Either<Failure, Stream<List<RideOffer>>> result =
        await getOffersUseCase(event.request);
    await result.fold(
      (failure) {
        print("emitting failure");
        emit(FetchPassengersFailure());
      },
      (Stream<List<RideOffer>> rideOffers) async {
        emit(FetchPassengersSuccess(rideOffers));
        // print("streaming");
        // final offers = <RideOffer>[];
        // await for (final rideOffer in rideOffers) {
        //   print(rideOffer);
        //   offers.add(rideOffer);
        //   emit(FetchPassengersSuccess(offers));
        // }

        // print("if I get there ..");
        // emit(FetchPassengersSuccess(offers));
        // rideOffers.listen((RideOffer rideOffer) {
        //   print("oh I found rideOffer");
        //   var ourState =
        //       BlocProvider.of<FetchPassengersBloc>(event.context).state;
        //   if (ourState is FetchPassengersSuccess) {
        //     ourState.rideOffers.add(rideOffer);
        //   }
        //   emit(ourState);
        // });
      },
    );
  }
}

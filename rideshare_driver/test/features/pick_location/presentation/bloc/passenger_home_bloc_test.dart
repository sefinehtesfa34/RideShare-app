import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:rideshare/core/errors/failures.dart';
import 'package:rideshare/features/pick_location/domain/entities/destination.dart';

import 'package:rideshare/features/pick_location/domain/usecases/destination_usecase.dart';
import 'package:rideshare/features/pick_location/presentation/bloc/passenger_home_bloc.dart';

import 'passenger_home_bloc_test.mocks.dart';

@GenerateMocks([FetchPassengerHistoryUseCase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late SlidingContainerBloc slidingContainerBloc;
  late NamesBloc namesBloc;
  late ChooseLocationsBloc chooseLocationsBloc;
  late CurrentLocationBloc currentLocationBloc;

  late MockFetchPassengerHistoryUseCase mockFetchPassengerHistoryUseCase;s

  setUp(() {
    mockFetchPassengerHistoryUseCase = MockFetchPassengerHistoryUseCase();
    slidingContainerBloc = SlidingContainerBloc();

    namesBloc = NamesBloc(
        fetchPassengerHistoryUseCase: mockFetchPassengerHistoryUseCase);
    chooseLocationsBloc = ChooseLocationsBloc();
    currentLocationBloc = CurrentLocationBloc();
  });
  tearDown(() {
    slidingContainerBloc.close();
    namesBloc.close();
    chooseLocationsBloc.close();
    currentLocationBloc.close();
  });

  group('SlidingContainerBloc', () {
    test('initial state is SearchDriverContainerVisibleState', () {
      expect(
          slidingContainerBloc.state, isA<SearchDriverContainerVisibleState>());
    });

    blocTest<SlidingContainerBloc, SlidingContainerState>(
      'emits SearchDriverContainerHiddenState when CancelEvent is added',
      build: () => slidingContainerBloc,
      act: (bloc) => bloc.add(CancelEvent()),
      expect: () => [isA<SearchDriverContainerHiddenState>()],
    );

    blocTest<SlidingContainerBloc, SlidingContainerState>(
      'toggles between states when ConfirmEvent is added',
      build: () => slidingContainerBloc,
      act: (bloc) {
        bloc.add(ConfirmEvent());
        bloc.add(ConfirmEvent());
      },
      expect: () => [
        isA<SearchDriverContainerHiddenState>(),
        isA<SearchDriverContainerVisibleState>(),
      ],
    );
  });

  group('NamesBloc', () {
    final tDestinationList = [
      Destination(
        name: 'Destination 1',
        latitude: 12.9715987, // Add your latitude here
        longitude: 77.5945627, // Add your longitude here
      ),
      Destination(
        name: 'Destination 2',
        latitude: 13.0826802, // Add your latitude here
        longitude: 80.2707184, // Add your longitude here
      ),
      Destination(
        name: 'Destination 3',
        latitude: 19.0760, // Add your latitude here
        longitude: 72.8777, // Add your longitude here
      ),
    ];

    test('initial state is NamesInitial', () {
      expect(namesBloc.state, isA<NamesInitial>());
    });

    blocTest<NamesBloc, NamesState>(
      'emits [NamesLoading, NamesLoaded] when NameEvent is added',
      build: () {
        when(mockFetchPassengerHistoryUseCase())
            .thenAnswer((_) async => Right(tDestinationList));
        return namesBloc;
      },
      act: (bloc) => bloc.add(FetchNamesEvent()),
      expect: () => [
        isA<NamesLoading>(),
        NamesLoaded(tDestinationList),
      ],
    );

    blocTest<NamesBloc, NamesState>(
      'emits [NamesLoading, NamesError] when NameEvent is added and usecase returns a failure',
      build: () {
        when(mockFetchPassengerHistoryUseCase())
            .thenAnswer((_) async => Left(ServerFailure()));
        return namesBloc;
      },
      act: (bloc) => bloc.add(FetchNamesEvent()),
      expect: () => [
        isA<NamesLoading>(),
        isA<NamesError>(),
      ],
    );
  });

  group('ChooseLocationsBloc', () {
    late ChooseLocationsBloc chooseLocationsBloc;

    setUp(() {
      chooseLocationsBloc = ChooseLocationsBloc();
    });

    test('initial state is ChooseLocationsInitial', () {
      expect(chooseLocationsBloc.state, ChooseLocationsInitial());
    });

    test(
        'emits [ChooseLocationsLoading, ChooseLocationsSucess] when SelectecLocationsEvent is added',
        () async {
      final expected = [
        ChooseLocationsLoading(),
        ChooseLocationsSucess(
            LatLng(37.422, -122.084),
            LatLng(37.7749, -122.4194),
            '1600 Amphitheatre Parkway, Mountain View, CA 94043, USA',
            'San Francisco, CA, USA')
      ];
      expectLater(chooseLocationsBloc.stream, emitsInOrder(expected));
      chooseLocationsBloc.add(
        SelectecLocationsEvent(
          '1600 Amphitheatre Parkway, Mountain View, CA 94043, USA',
          'San Francisco, CA, USA',
          LatLng(37.422, -122.084),
          LatLng(37.7749, -122.4194),
        ),
      );
    });

    test(
        'emits [ChooseLocationsLoading, ChooseLocationsSucess] when SelectecLocationFromList is added',
        () async {
      final expected = [
        ChooseLocationsLoading(),
        ChooseLocationsSucess(
            LatLng(37.422, -122.084),
            LatLng(37.7749, -122.4194),
            '1600 Amphitheatre Parkway, Mountain View, CA 94043, USA',
            'San Francisco, CA, USA')
      ];
      expectLater(chooseLocationsBloc.stream, emitsInOrder(expected));
      chooseLocationsBloc.add(
        SelectecLocationFromList(
          37.7749,
          -122.4194,
          'San Francisco, CA, USA',
          37.422,
          -122.084,
        ),
      );
    });
  });

group('CurrentLocationBloc', () {
   
    test('initial state is CurrentLocationInitial', () {
      expect(currentLocationBloc.state, CurrentLocationInitial());
    });

    test('emits [CurrentLocationLoading, CurrentLocationSuccess] when CurrentLocationEvent is added', () async {
      final expected = [
        CurrentLocationLoading(),
        CurrentLocationSuccess(
          LatLng(37.422, -122.084),
        ),
      ];
      expectLater(currentLocationBloc.stream, emitsInOrder(expected));
      currentLocationBloc.add(FetchCurrentLocationEvent());
    });
  });

}

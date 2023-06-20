import 'package:rideshare/core/error/exceptions.dart';
import 'package:rideshare/core/error/failures.dart';
import 'package:rideshare/core/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rideshare/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:rideshare/features/authentication/data/model/auth_login_model.dart';
import 'package:rideshare/features/authentication/data/repository/auth_repo.dart';

import 'auth_repo_test.mocks.dart';

@GenerateMocks([AuthenticationRemoteDataSource, NetworkInfo])
void main() {
  late AuthenticationRepositoryImpl repository;
  late MockAuthenticationRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  setUp(() {
    mockRemoteDataSource = MockAuthenticationRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AuthenticationRepositoryImpl(
        remoteDataSource: mockRemoteDataSource, networkInfo: mockNetworkInfo);
  });
  group('login', () {
    const tPhoneNumber = '993937576';
    final tAuthLoginModel = AuthLoginModel(phoneNumber: tPhoneNumber);
    final tLoginPayload = tAuthLoginModel;

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return LoginPayload when the call to remote data source is succesful',
          () async {
        when(mockRemoteDataSource.login(any))
            .thenAnswer((_) async => tAuthLoginModel);
        final result = await repository.login(phoneNumber: tPhoneNumber);
        verify(mockRemoteDataSource.login(tPhoneNumber));
        expect(result, equals(Right(tLoginPayload)));
      });
      test(
          'should return ServerFailure when the call to remote data source is unsuccessful',
          () async {
        when(mockRemoteDataSource.login(any)).thenThrow(ServerException());

        try {
          await repository.login(phoneNumber: tPhoneNumber);
        } catch (e) {
          expect(e, isA<ServerException>());
        }
      });
    });
    //   group('device is offline', () {
    //     setUp(() {when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);});
    //   });
    //   test('should return a NoConnectionFailure if the device is offline',
    //       () async {
    //     //arrange
    //     when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

    //     //act
    //     final result = await repository.login(tPhoneNumber);

    //     //assert
    //     verifyZeroInteractions(mockRemoteDataSource);
    //     expect(result, equals(const Left(;
    //   });
    // });
  });
}

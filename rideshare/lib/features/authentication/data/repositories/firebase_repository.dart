import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/exceptions.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repositories/firebase_repository.dart';
import '../datasources/firebase_datasource.dart';

class FirebaseOtpRepositoryImpl implements FirebaseOtpRepository {
  final FirebaseDataSource dataSource;

  FirebaseOtpRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, SendParams>> sendOTP(String phoneNumber) async {
    try {
      return Right<Failure, SendParams>(await dataSource.sendOTP(phoneNumber));
    } on InputException {
      return const Left<Failure, SendParams>(
          InputFailure('Failed to send OTP'));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOTP(
      String verificationId, String otp) async {
    try {
      await dataSource.verifyOTP(verificationId, otp);
      return const Right<Failure, void>(null);
    } on InputException {
      return const Left<Failure, void>(InputFailure('Failed to verify OTP'));
    }
  }
}

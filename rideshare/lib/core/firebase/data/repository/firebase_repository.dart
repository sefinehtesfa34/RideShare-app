import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:rideshare/core/errors/exceptions.dart';
import 'package:rideshare/core/firebase/domain/repository/otp_verification_repository.dart';

import '../../../errors/failures.dart';
import '../datasource/firebase_datasource.dart';

class FirebaseOtpRepositoryImpl implements FirebaseOtpRepository {
  final FirebaseDataSource dataSource;

  FirebaseOtpRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, String>> sendOTP(String phoneNumber) async {
    try {
      return Right<Failure, String>(await dataSource.sendOTP(phoneNumber));
    } on InputException {
      return const Left<Failure, String>(InputFailure('Failed to send OTP'));
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

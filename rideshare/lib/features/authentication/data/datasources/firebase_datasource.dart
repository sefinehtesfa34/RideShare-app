import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rideshare/features/authentication/presentation/bloc/firebase/bloc/firebase_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

abstract class FirebaseDataSource {
  Future<SendParams> sendOTP(String phoneNumber);
  Future<void> verifyOTP(String verificationId, String otp);
}

class FirebaseDataSourceImpl extends FirebaseDataSource {
  final FirebaseAuth firebaseAuth;

  FirebaseDataSourceImpl({required this.firebaseAuth});

  @override
  Future<SendParams> sendOTP(String phoneNumber) async {
    SharedPreferences sharedPreferences = await cacheManager.sharedPreferences;
    final Completer<SendParams> completer = Completer<SendParams>();

    verificationCompleted(PhoneAuthCredential credential) => {};

    verificationFailed(FirebaseAuthException exception) =>
        completer.completeError(exception);

    codeSent(String verificationId, int? resendToken) async {
      sharedPreferences.setString('verificationId', verificationId);
      try {
        http.Client client = http.Client();
        final http.Response response = await client.get(
            Uri.parse('https://rideshare-app.onrender.com/api/User/login'));
        if (response.statusCode == 200) {
          sharedPreferences.setBool('isSignedUp', true);
        }
      } catch (e) {
        sharedPreferences.setBool('isSignedUp', false);
      }
    }

    codeAutoRetrievalTimeout(String verificationId) => {};

    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: const Duration(seconds: 30),
      );
      return await completer.future;
    } catch (e) {
      throw ('Failed to send OTP');
    }
  }

  @override
  Future<void> verifyOTP(String verificationId, String otp) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      throw Exception('Failed to verify OTP');
    }
  }
}

class SendParams {
  final bool isSignedUp;
  final String verificationId;
  SendParams({required this.isSignedUp, required this.verificationId});
}

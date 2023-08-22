

import 'package:mockito/annotations.dart';
import 'package:rideshare/features/authentication/domain/usecases/verify_otp.dart';

@GenerateMocks([OtpVerificationUseCase])
void main() {
//   late OtpBloc otpBloc;
//   late MockOtpVerificationUseCase mockUseCase;

//   setUp(() {
//     mockUseCase = MockOtpVerificationUseCase();
//     otpBloc = OtpBloc(useCase: mockUseCase);
//   });

//   tearDown(() {
//     otpBloc.close();
//   });

//   group('OtpBloc', () {
//     const phoneNumber = '1234567890';
//     const otp = '123456';

//     test('initial state is OtpVerificationInitial', () {
//       expect(otpBloc.state, OtpVerificationInitial());
//     });

//     blocTest<OtpBloc, OtpVerificationState>(
//       'emits [OtpVerificationLoading, OtpVerificationSuccess] when OTP verification succeeds',
//       build: () {
//         when(() => mockUseCase.call(Params(phoneNumber: phoneNumber, otp: otp)))
//             .thenAnswer((_) => () => Future.value(Right<Failure, bool>(true)));
//         return otpBloc;
//       },
//       act: (bloc) =>
//           bloc.add(VerifyOtpEvent(phoneNumber: phoneNumber, otp: otp)),
//       expect: () => [
//         OtpVerificationLoading(),
//         OtpVerificationSuccess(),
//       ],
//     );

//     blocTest<OtpBloc, OtpVerificationState>(
//       'emits [OtpVerificationLoading, OtpVerificationFailure] when OTP verification fails',
//       build: () {
//         when(() => mockUseCase.call(anyNamed("otp"))).thenAnswer(
//             (_) => () => Future.value(Left(ServerFailure('Server Failure'))));
//         return otpBloc;
//       },
//       act: (bloc) =>
//           bloc.add(VerifyOtpEvent(phoneNumber: phoneNumber, otp: otp)),
//       expect: () => [
//         OtpVerificationLoading(),
//         OtpVerificationFailure('Server Failure'),
//       ],
//     );

// blocTest<OtpBloc, OtpVerificationState>(
//   'emits [OtpVerificationLoading, OtpVerificationFailure] when OTP is wrong',
//   build: () {
//     when(() => mockUseCase.call(anyNamed('otp')))
//     .thenAnswer((_) => Future.value(Right<Failure, bool>(false)));
//     return otpBloc;
//   },
//   act: (bloc) =>
//       bloc.add(VerifyOtpEvent(phoneNumber: phoneNumber, otp: otp)),
//   expect: () => [
//     OtpVerificationLoading(),
//     OtpVerificationFailure('Wrong OTP!'),
//   ],
// );
//   });
}

// import 'package:email_otp/email_otp.dart';
// import 'package:flutter/material.dart';

// class VerifyOtp extends StatefulWidget {
//   const VerifyOtp({Key? key}) : super(key: key);

//   @override
//   State<VerifyOtp> createState() => _VerifyOtpState();
// }

// class _VerifyOtpState extends State<VerifyOtp> {
//   TextEditingController email = TextEditingController();
//   TextEditingController otp =  TextEditingController();
//   EmailOTP myauth = EmailOTP();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Card(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                         controller: email,
//                         decoration:
//                             const InputDecoration(hintText: "User Email")),
//                   ),
//                   ElevatedButton(
//                       onPressed: () async {
//                         myauth.setConfig(
//                           appEmail: "me@rohitchouhan.com",
//                           appName: "Email OTP",
//                           userEmail: email.text,
//                           otpLength: 6,
//                           otpType: OTPType.digitsOnly
//                         );
//                         if (await myauth.sendOTP() == true) {
//                           ScaffoldMessenger.of(context)
//                               .showSnackBar(const SnackBar(
//                             content: Text("OTP has been sent"),
//                           ));
//                         } else {
//                           ScaffoldMessenger.of(context)
//                               .showSnackBar(const SnackBar(
//                             content: Text("Oops, OTP send failed"),
//                           ));
//                         }
//                       },
//                       child: const Text("Send OTP")),
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                         controller: otp,
//                         decoration:
//                             const InputDecoration(hintText: "Enter OTP")),
//                   ),
//                   ElevatedButton(
//                       onPressed: () async {
//                         if (await myauth.verifyOTP(otp: otp.text) == true) {
//                           ScaffoldMessenger.of(context)
//                               .showSnackBar(const SnackBar(
//                             content: Text("OTP is verified"),
//                           ));
//                         } else {
//                           ScaffoldMessenger.of(context)
//                               .showSnackBar(const SnackBar(
//                             content: Text("Invalid OTP"),
//                           ));
//                         }
//                       },
//                       child: const Text("Verify")),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
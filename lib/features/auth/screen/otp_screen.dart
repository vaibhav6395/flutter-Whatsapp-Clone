import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clonee/colors.dart';
import 'package:whatsapp_clonee/features/auth/controller/authcontroller.dart';

class OtpScreen extends ConsumerWidget {
  static const String Routename = '/otp-screen';
  final String verificationid;
  const OtpScreen({super.key, required this.verificationid});

  void VerifyOTP(BuildContext context, String userotp, WidgetRef ref) {
    ref
        .read(AuthcontrollerProvider)
        .VerifyOTP(context, verificationid, userotp);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text("Enter OTP to Verify"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 25),

            const Text("SMS is sended with otp", textAlign: TextAlign.center),
            SizedBox(
              width: size.width * 0.5,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: '- - - - - -',
                  hintStyle: TextStyle(fontSize: 30, letterSpacing: 4),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 6) {
                    VerifyOTP(context, value.trim(), ref);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

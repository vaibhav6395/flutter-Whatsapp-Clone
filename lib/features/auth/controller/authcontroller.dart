import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clonee/features/auth/repository/auth_repository.dart';

final AuthcontrollerProvider = Provider((ref) {
  final authrepository = ref.watch(AuthRepositoryProvider);
  return Authcontroller(authRepository: authrepository);
});

class Authcontroller {
  final AuthRepository authRepository;

  Authcontroller({required this.authRepository});

  void Signinwithphone(BuildContext context, String phonenumber) {
    authRepository.SigninwithPhone(context, phonenumber);
  }

  void VerifyOTP(BuildContext context, String verificationid, String userotp) {
    authRepository.verifyOTP(
      context: context,
      verificationid: verificationid,
      userotp: userotp,
    );
  }
}

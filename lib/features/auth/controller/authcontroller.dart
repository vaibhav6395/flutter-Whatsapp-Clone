import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clonee/features/auth/repository/auth_repository.dart';
import 'package:whatsapp_clonee/models/usermodel.dart';

final AuthcontrollerProvider = Provider((ref) {
  final authrepository = ref.watch(AuthRepositoryProvider);
  return Authcontroller(authRepository: authrepository, ref);
});
final UserdataAuthProvider = FutureProvider((ref) {
  final authcontroller = ref.watch(AuthcontrollerProvider).getCurrentUserData();
  return authcontroller;
});

class Authcontroller {
  final AuthRepository authRepository;
  final Ref ref;
  Authcontroller(this.ref, {required this.authRepository});

  Future<Usermodel?> getCurrentUserData() async {
    return await authRepository.getCurrentUserData();
  }

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

  void SaveuserDatatoFirebase(
    BuildContext context,
    String name,
    File? profilepic,
  ) {
    authRepository.saveuserDatatoFirebase(
      username: name,
      profileimage: profilepic,
      ref: ref,
      context: context,
    );
  }
}

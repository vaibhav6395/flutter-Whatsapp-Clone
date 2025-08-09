import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clonee/common/repository%5D/commonFirebaseStorage.dart';
import 'package:whatsapp_clonee/common/utils/utils.dart';
import 'package:whatsapp_clonee/features/auth/screen/otp_screen.dart';
import 'package:whatsapp_clonee/features/auth/screen/user_information_screen.dart';
import 'package:whatsapp_clonee/models/usermodel.dart';
import 'package:whatsapp_clonee/screens/mobile_layout_screen.dart';

final AuthRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({required this.auth, required this.firestore});

  Future<Usermodel?> getCurrentUserData() async {
    var userData = await firestore
        .collection('users')
        .doc(auth.currentUser?.uid)
        .get();
    Usermodel? user;
    if (userData.data() != null) {
      user = Usermodel.fromMap(userData.data()!);
    }
    return user;
  }

  void SigninwithPhone(BuildContext context, String phonenumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phonenumber,
        verificationCompleted: (PhoneAuthCredential credentials) async {
          await auth.signInWithCredential(credentials);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: ((String verificationId, int? resedtoken) async {
          Navigator.pushNamed(
            context,
            OtpScreen.Routename,
            arguments: verificationId,
          );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      Showsnackbar(context: context, content: e.toString());
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationid,
    required String userotp,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationid,
        smsCode: userotp,
      );
      await auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
        context,
        UserInformationScreen.Routename,
        (route) => false,
      );
    } on FirebaseAuth catch (e) {
      Showsnackbar(context: context, content: e.toString());
    }
  }

  Future<void> saveuserDatatoFirebase({
    required String username,
    required File? profileimage,
    required Ref ref,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String picurl =
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRPKltIvnPNAE-BQNHgXNJS08JkTrETyQIDA&s";
      if (profileimage != null) {
        picurl = await ref
            .read(CommonfirebasestorageProvider)
            .storeFiletofirebase('profile-pics$uid', profileimage);
      }
      var user = Usermodel(
        username: username,
        uid: uid,
        profilepic: picurl,
        isOnline: true,
        phoneNumber: auth.currentUser!.phoneNumber ?? '',
        groupid: [],
      );
      await firestore.collection('users').doc(uid).set(user.toMap());

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MobileLayoutScreen()),
        (route) => false,
      );
    } catch (e) {
      Showsnackbar(context: context, content: e.toString());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:whatsapp_clonee/common/widgets/errorbody.dart';
import 'package:whatsapp_clonee/features/auth/screen/loginscreen.dart';
import 'package:whatsapp_clonee/features/auth/screen/otp_screen.dart';
import 'package:whatsapp_clonee/features/auth/screen/user_information_screen.dart';

Route<dynamic> genereatedRoute(RouteSettings settings) {
  switch (settings.name) {
    case Loginscreen.Routename:
      return MaterialPageRoute(builder: (context) => const Loginscreen());
    case OtpScreen.Routename:
      final verificationid = settings.arguments as String;
      return MaterialPageRoute(builder: (context) => OtpScreen(verificationid: verificationid));
       case UserInformationScreen.Routename:
      return MaterialPageRoute(builder: (context) => const UserInformationScreen());
      

    default:
      return MaterialPageRoute(
        builder: (context) =>
            const Scaffold(body: Errorbody(Error: 'This page doesn\'t exist')),
      );
  }
}

import 'package:flutter/material.dart';
import 'package:whatsapp_clonee/colors.dart';
import 'package:whatsapp_clonee/common/widgets/custombutton.dart';
import 'package:whatsapp_clonee/features/auth/screen/loginscreen.dart';

class Landingscreen extends StatelessWidget {
  const Landingscreen({super.key});

  void Navigatetologinscreen(BuildContext context) {
    Navigator.pushNamed(context, Loginscreen.Routename);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                "Welcome To WhatsApp ",
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: size.height / 10),
              Image.asset(
                'assets/images/bg.png',
                height: 340,
                width: 340,
                color: tabColor,
              ),
              SizedBox(height: size.height / 10),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Read our Privacy and Policy.Tap "agree and continue" to accept all the Terms of condition ',
                  style: TextStyle(color: greycolor),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              Custombutton(
                text: "Agree and Continue",
                onpressed: () => Navigatetologinscreen(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

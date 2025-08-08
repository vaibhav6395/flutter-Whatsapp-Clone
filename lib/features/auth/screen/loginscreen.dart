import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clonee/colors.dart';
import 'package:whatsapp_clonee/common/utils/utils.dart';
import 'package:whatsapp_clonee/common/widgets/custombutton.dart';
import 'package:whatsapp_clonee/features/auth/controller/authcontroller.dart';

class Loginscreen extends ConsumerStatefulWidget {
  static const Routename = '/login-Screen';
  const Loginscreen({super.key});

  @override
  ConsumerState<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends ConsumerState<Loginscreen> {
  final phonecontrller = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phonecontrller.dispose();
  }

  void pickcountry() {
    showCountryPicker(
      context: context,
      onSelect: (Country _country) {
        setState(() {
          country = _country;
        });
      },
    );
  }

  void sendphonenumber() {
    String phonenumber = phonecontrller.text.trim();
    if (country != null && phonenumber.isNotEmpty) {
      ref
          .read(AuthcontrollerProvider)
          .Signinwithphone(context, '+${country!.phoneCode}$phonenumber');
    } else {
      Showsnackbar(
        context: context,
        content: "please filled out all the feilds",
      );  
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text("Enter Your Phone number"),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Whatsapp will needs to verify your mobile number",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              TextButton(
                onPressed: () => pickcountry(),
                child: const Text("pick Country"),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  if (country != null) Text("+${country!.phoneCode}"),
                  SizedBox(width: 10),
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextField(
                      controller: phonecontrller,
                      decoration: InputDecoration(hintText: "phone number"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.6),
              SizedBox(
                width: 90,
                child: Custombutton(
                  text: "Next",
                  onpressed: () => sendphonenumber(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

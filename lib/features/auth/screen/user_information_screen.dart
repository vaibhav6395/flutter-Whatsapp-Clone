import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clonee/colors.dart';
import 'package:whatsapp_clonee/common/utils/utils.dart';
import 'package:whatsapp_clonee/common/widgets/custombutton.dart';
import 'package:whatsapp_clonee/features/auth/controller/authcontroller.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  static const String Routename = 'user-Info-Screen';
  const UserInformationScreen({super.key});

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

TextEditingController usernamecontroller = TextEditingController();

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  File? profileimage;
  @override
  void dispose() {
    usernamecontroller.dispose();
    super.dispose();
  }

  void Selectedimage() async {
    profileimage = await SelectImage(context);
  }

  void StoreUserData() async {
    String name = usernamecontroller.text.trim();
    if (name.isNotEmpty) {
      ref
          .read(AuthcontrollerProvider)
          .SaveuserDatatoFirebase(context, name, profileimage);
      print("submitted");
    }
    print("not submitted");
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: size.height / 5),

              Stack(
                children: [
                  profileimage != null
                      ? CircleAvatar(
                          radius: 60,
                          backgroundColor: greycolor,
                          backgroundImage: FileImage(profileimage!),
                        )
                      : CircleAvatar(
                          radius: 60,
                          backgroundColor: greycolor,
                          backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRPKltIvnPNAE-BQNHgXNJS08JkTrETyQIDA&s",
                          ),
                        ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: Selectedimage,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: size.width * 0.9,
                    padding: const EdgeInsets.all(25.0),
                    child: TextField(
                      textInputAction: TextInputAction.go,
                      controller: usernamecontroller,
                      decoration: const InputDecoration(hintText: "Username"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.4),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Custombutton(
                  text: "Done",
                  onpressed:StoreUserData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

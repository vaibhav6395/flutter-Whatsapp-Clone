import 'package:flutter/material.dart';
import 'package:whatsapp_clonee/colors.dart';

class Custombutton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const Custombutton({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: tabColor,
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: onpressed,
      child: Text(text, style: const TextStyle(color: blackcolor)),
    );
  }
}

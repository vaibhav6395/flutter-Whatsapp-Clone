import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void Showsnackbar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}


Future<File?> SelectImage(BuildContext context) async {
  final ImagePicker imagePicker = ImagePicker();
  final XFile? file = await imagePicker.pickImage(
    source: ImageSource.gallery,
    imageQuality: 50,
  );
  if (file != null) {
        Showsnackbar(context: context, content: " image selected ${file.path}");

    return File(file.path);
    
  } else {
    Showsnackbar(context: context, content: "No image selected");
    return null;
  }
}

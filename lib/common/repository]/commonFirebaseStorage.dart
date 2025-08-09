import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final CommonfirebasestorageProvider = Provider(
  (ref) => Commonfirebasestorage(firebaseStorage: FirebaseStorage.instance),
);

class Commonfirebasestorage {
  final FirebaseStorage firebaseStorage;

  Commonfirebasestorage({required this.firebaseStorage});

  Future<String> storeFiletofirebase(String refrence, File file) async {
    UploadTask task = firebaseStorage.ref().child(refrence).putFile(file);
    TaskSnapshot snap = await task;
    String downloadurl = await snap.ref.getDownloadURL();
    return downloadurl;
  }
}

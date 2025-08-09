import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clonee/common/utils/utils.dart';
import 'package:whatsapp_clonee/models/usermodel.dart';

final SelectContactRepositoryProvider = Provider(
  (ref) => SelectContactRepository(firestore: FirebaseFirestore.instance),
);

class SelectContactRepository {
  final FirebaseFirestore firestore;

  SelectContactRepository({required this.firestore});

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      // using flutter contacts dependecy
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contacts;
  }

  Future<void> SelectContact(
    Contact SelectedContacts,
    BuildContext context,
  ) async {
    try {
      var usercollection = await firestore.collection('users').get();
      bool isFound = false;
      for (var document in usercollection.docs) {
        var userdata = Usermodel.fromMap(document.data());
        if (userdata.phoneNumber == SelectedContacts.phones[0].number) {
          isFound = true;
          // Navigate to chat screen with selected contact
          Navigator.pushNamed(context, '/chat-screen', arguments: userdata);
          break;
        }
      }
    } catch (e) {
      Showsnackbar(context: context, content: e.toString());
    }
  }
}

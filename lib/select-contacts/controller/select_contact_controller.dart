import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clonee/select-contacts/repository/select-contact-reposiotry.dart';

final getContactsProvider = FutureProvider((ref) {
  final SelectContactRepository = ref.watch(SelectContactRepositoryProvider);
  return SelectContactRepository.getContacts();
});

final SelectContactProvider = Provider((ref) {
  final SelectContactRepository = ref.watch(SelectContactRepositoryProvider);
  return SelectContactController(
    ref: ref,
    selectContactRepository: SelectContactRepository,
  );
});

class SelectContactController {
  final Ref ref;
  final SelectContactRepository selectContactRepository;

  SelectContactController({
    required this.ref,
    required this.selectContactRepository,
  });

  void SelectContact(Contact selectedContact, BuildContext context) async {
    await selectContactRepository.SelectContact(selectedContact, context);
  }
}

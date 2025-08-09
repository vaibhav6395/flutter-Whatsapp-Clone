import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clonee/common/widgets/loader.dart';
import 'package:whatsapp_clonee/select-contacts/controller/select_contact_controller.dart';
import 'package:whatsapp_clonee/select-contacts/widgets/select_contect_item.dart';

class SelectContactScreen extends ConsumerWidget {
  static const String Routename = 'select-contact-screen';
  const SelectContactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Contacts'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: ref
          .watch(getContactsProvider)
          .when(
            data: (contactlist) => SelectContectItem(contactlist: contactlist),
            error: (err, trace) => ErrorWidget(err.toString()),
            loading: () => const Loader(),
          ),
    );
  }
}

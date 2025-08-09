import 'package:flutter/material.dart';

class SelectContectItem extends StatelessWidget {
  final List contactlist;
  const SelectContectItem({super.key, required this.contactlist});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
                itemCount: contactlist.length,
                itemBuilder: (context, index) {
                  final contacts = contactlist[index];
                  return InkWell(
                    onTap: (){},
                    child: ListTile(title: Text(contacts.displayName,style: const TextStyle(fontSize: 18),),
                    leading: contacts.photo != null
                        ? CircleAvatar(
                            backgroundImage: MemoryImage(contacts.photo!),
                          )
                        : const CircleAvatar(
                            child: Icon(Icons.person),
                          )),
                  );
                },
              ),
      ),
    );
  }
}
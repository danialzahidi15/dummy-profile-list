import 'package:dummy_profile_listing/contact/profile_view.dart';
import 'package:dummy_profile_listing/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../json/contacts.dart';
import 'edit_profile_view.dart';

class ContactList extends StatelessWidget {
  final String name;
  final String email;
  final String avatar;
  final Services _deleteContacts = Services();
  final Datum? post;

  ContactList({Key? key, this.post, required this.name, required this.email, required this.avatar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: ((context) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((BuildContext context) => EditProfile()),
                ),
              );
            }),
            icon: Icons.create_outlined,
            backgroundColor: const Color.fromARGB(255, 220, 253, 237),
            foregroundColor: Colors.yellow,
          ),
          SlidableAction(
            onPressed: ((context) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text(
                          'Are you sure want to delete delete this contact?',
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              await _deleteContacts.deleteContact(post!.id.toString());
                              // Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                        ],
                      ));
            }),
            icon: Icons.delete_outline_rounded,
            backgroundColor: const Color.fromARGB(255, 220, 253, 237),
            foregroundColor: Colors.red,
          )
        ]),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((BuildContext context) => Profile()),
              ),
            );
          },
          hoverColor: Colors.green[100],
          title: Text(name),
          subtitle: Text(email),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(avatar),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.send_outlined),
            color: Colors.blueAccent,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

import 'package:dummy_profile_listing/service.dart';
import 'package:flutter/material.dart';
import '../json/contacts.dart';

class Profile extends StatelessWidget {
  final Services _contacts = Services();
  final Datum? post;

  Profile({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: FutureBuilder(
        future: _contacts.getSingleContact(post != null ? post!.id.toString() : ''),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == 0) {
              return const Center(
                child: Text('Cannot get contact'),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit',
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.greenAccent,
                      width: 4,
                    ),
                  ),
                  child: const CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 60,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text('${post?.firstName} ${post?.lastName}'),
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: double.maxFinite,
                  color: Colors.black12,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                      Text(
                        post == null ? '${post?.email}' : 'ahaha',
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      ),
                    ),
                    child: const Text(
                      'Send Email',
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}

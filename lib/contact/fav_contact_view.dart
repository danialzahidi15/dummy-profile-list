import 'package:flutter/material.dart';

class FavouriteContact extends StatelessWidget {
  const FavouriteContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: ListTile(
        onTap: () {},
        hoverColor: Colors.green[100],
        title: Row(
          children: const [
            Text('name'),
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
          ],
        ),
        subtitle: const Text('email'),
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.send_outlined),
          color: Colors.grey,
          onPressed: () {},
        ),
      ),
    );
  }
}

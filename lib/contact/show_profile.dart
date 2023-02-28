import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const Text(''),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: double.maxFinite,
              color: Colors.black12,
              child: Column(
                children: const [
                  Icon(
                    Icons.email_outlined,
                    color: Colors.greenAccent,
                    size: 40,
                  ),
                  Text(
                    'roxie@test.com',
                    style: TextStyle(
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
  }
}
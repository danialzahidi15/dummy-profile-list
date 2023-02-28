import 'package:flutter/material.dart';
import '../json/contacts.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key, this.post}) : super(key: key);

  final Datum? post;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(child: FutureBuilder(
          // future: _createContact.postContact(),
          builder: ((context, snapshot) {
            return Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 60,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              FillContactDetails(
                controller: _firstNameController,
                name: post != null ? post!.firstName : 'First Name',
              ),
              const SizedBox(height: 20.0),
              FillContactDetails(
                controller: _lastNameController,
                name: post != null ? post!.firstName : 'Last Name',
              ),
              const SizedBox(height: 20.0),
              FillContactDetails(
                controller: _emailController,
                name: post != null ? post!.firstName : 'Email',
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  print(_firstNameController);
                  print(_lastNameController);
                  print(_emailController);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  ),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ]);
          }),
        )),
      ),
    );
  }
}

class FillContactDetails extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  const FillContactDetails({Key? key, required this.name, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: name,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          borderSide: BorderSide(color: Color.fromRGBO(50, 186, 165, 1.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          borderSide: BorderSide(color: Color.fromRGBO(50, 186, 165, 1.0)),
        ),
      ),
    );
  }
}

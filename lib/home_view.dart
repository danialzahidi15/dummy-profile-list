import 'dart:developer';

import 'package:dummy_profile_listing/contact/edit_profile_view.dart';
import 'package:dummy_profile_listing/model/contacts.dart';
import 'package:dummy_profile_listing/service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'contact/all_contact_view.dart';
import 'contact/fav_contact_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final Services _users = Services();
  final TextEditingController _contact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contacts'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh_outlined,
            ),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((BuildContext context) => EditProfile()),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            height: 100,
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: TextField(
                controller: _contact,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Search Contact',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(26.0),
                    ),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(26.0),
                    ),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                controller: _tabController,
                isScrollable: true,
                padding: const EdgeInsets.all(20.0),
                indicatorPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                indicator: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(4),
                ),
                tabs: const [
                  Tab(text: 'All'),
                  Tab(text: 'Favourite'),
                ]),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              FutureBuilder<List>(
                  future: _users.getContact(),
                  builder: (context, model) {
                    if (model.hasData) {
                      if (model.data!.isEmpty) {
                        return const Center(
                          child: Text('No list of contact here, add contact now'),
                        );
                      }
                      return ListView.builder(
                          itemCount: model.data?.length,
                          itemBuilder: (context, index) {
                            return ContactList(
                              name: '${model.data![index]['first_name']} ${model.data![index]['last_name']}',
                              email: model.data![index]['email'],
                              avatar: model.data![index]['avatar'],
                            );
                          });
                    } else if (model.hasError) {
                      return Center(
                        child: Text(model.error.toString()),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if(snapshot.data! == 0) {
                      return const Center(child: Text('No list of contact here, add contact now'),);
                    }
                    return const FavouriteContact();
                  } else {
                    return Center(
                        child: Text(snapshot.error.toString()),
                      );
                  }
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

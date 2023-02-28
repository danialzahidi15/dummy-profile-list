import 'package:flutter/material.dart';

import 'home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dummy Profile Listing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.greenAccent,
        ),
        tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Colors.black38,
        )
      ),
      home: const HomePage(),
    );
  }
}

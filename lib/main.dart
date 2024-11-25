import 'package:flutter/material.dart';
import 'package:flutter_application_1/Homepage.dart';

void main() {
  runApp(MyApp()); // This is where the Flutter app is run
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

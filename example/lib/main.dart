import 'package:flutter/material.dart';
import 'package:galactic_compass_example/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Galactic Compass Demo',
      home: HomePage(),
    );
  }
}

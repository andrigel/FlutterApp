import 'package:flutter/material.dart';
import 'package:flutter_app/page/home_page.dart';

Future main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: HomePage(),
    color: Colors.green,
  );
}
import 'package:flutter/material.dart';
import 'package:take_home_test/pages/principal.dart';
 
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Take Home Test',
      debugShowCheckedModeBanner: false,
      home: Principal()
    );
  }
}
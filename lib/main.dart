import 'package:currency_converter/currency_home.dart';
import 'package:currency_converter/currency_home_cup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          MaterialHome(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyCupApp extends StatelessWidget {
  const MyCupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(home: CurrencyHomeCup());
  }
}

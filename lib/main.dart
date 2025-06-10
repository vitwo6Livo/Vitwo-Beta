import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/global/bottomNav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: bottomNavBar());
  }
}

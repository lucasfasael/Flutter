import 'dart:math';

import 'package:flutter/material.dart';
import 'package:petinder/match_screen.dart';

import 'home_page.dart';

void main() {
  runApp(const AppInit());
}

class AppInit extends StatelessWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petinder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Petinder'),
    );
  }
}

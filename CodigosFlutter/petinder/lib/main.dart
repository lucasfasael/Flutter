import 'package:flutter/material.dart';
import 'package:petinder/perfil_dog.dart';

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
      home: const HomePage(title: 'Petinder'),
    );
  }
}


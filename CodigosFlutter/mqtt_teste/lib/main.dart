import 'package:flutter/material.dart';

import 'home.dart';
import 'sobre.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Irrigação',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 0, 255, 81)),
          useMaterial3: true,
        ),
        home: const Home(),
        routes: {"sobre": (context) => (const Sobre())});
  }
}

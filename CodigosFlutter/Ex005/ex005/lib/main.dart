import 'package:ex005/counter/counter_viewer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arquitetura Clean',
      home: const CounterView(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}


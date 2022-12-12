import 'package:calculadora/widgets/sobre.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => (const HomePage()),
        "sobre": (context) => (Sobre()),
      },
      theme: ThemeData.dark(),
    ));
  }
}

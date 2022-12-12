import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              color: Colors.red,
              width: 400,
              height: 400,
            ),
            Container(
              color: Colors.blue,
              width: 200,
              height: 200,
            )
          ],
        ));
  }
}

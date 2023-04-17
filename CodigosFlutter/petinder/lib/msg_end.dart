import 'package:flutter/material.dart';

class Msg extends StatelessWidget {
  const Msg({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 198, 185, 185),
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
          ),
          width: width * 0.9,
          height: height * 0.72,
        ),
      ),
    );
  }
}

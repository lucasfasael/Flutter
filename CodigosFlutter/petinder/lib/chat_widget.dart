import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(20),
          color: Colors.amber,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            child: SingleChildScrollView(
              child: Text(
                "Batata sadouij asoidja soija sodiasodjas odjoasi dsaojdasoiji asiudh asiduhas ",
              ),
            ),
          ),
        ),
      ),
    );
  }
}

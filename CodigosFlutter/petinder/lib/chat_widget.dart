// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final String msg;
  ChatWidget({
    Key? key,
    required this.msg,
  }) : super(key: key);

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
                msg,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

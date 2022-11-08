import 'dart:ffi';

import 'package:flutter/material.dart';

class sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Sobre")),
      body: Center(
        child: Container(
            width: size.width,
            height: size.height,
            color: Colors.cyan,
            child: Scrollbar(
              child: ListView(
                children: [
                  Row(
                    children: [Text("Hello World!")],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

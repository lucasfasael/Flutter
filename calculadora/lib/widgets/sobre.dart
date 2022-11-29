import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true ,
        title: Text(
          "Desenvolvedores"),
          ),
      body: Stack(
        children: 
          [
            Container(
              width: size.width,
              height: size.height,
              child: Image.asset(
                "assets/icon/2.png",
                fit: BoxFit.cover,
                ),
            ),
            Container(
              color: Color.fromARGB(179, 0, 0, 0)            ),
            Center(
            child: Container(
                width: size.width * 0.9,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.asset("assets/icon/1.jpg"),
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(child: Text(
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            "Hello, meu nome é Verenilson da Silva Souza e estou aprendendo o Framework Flutter! :D",
                          ),),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.asset("assets/icon/3.jpg"),
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(child: Text(
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            "Hello, meu nome é Lucas Fasael e estou aprendendo o Framework Flutter! :D",
                          ),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}

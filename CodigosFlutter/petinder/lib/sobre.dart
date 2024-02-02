import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Desenvolvedor"),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Image.asset(
              "assets/images/2.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(color: const Color.fromARGB(179, 0, 0, 0)),
          Center(
            child: SizedBox(
              width: size.width * 0.9,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(999),
                          child: Image.asset(
                            "assets/images/3.jpg",
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          )),
                    ),
                  ),
                  Row(
                    children: const [
                      Flexible(
                        child: Text(
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          "Olá, meu nome é Lucas Fasael, sou o criador e desenvolvedor do Petinder !",
                        ),
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

import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("Sobre"),
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
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          "Olá, esta aplicação é para checar o nível de umidade da planta do projeto de IOT, quando a umidade estiver abaixo de 40% significa que a planta será irrigada !",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Text(
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      "As informações a respeito da umidade são recebidas  em tempo real através do protocolo MQTT !",
                    ),
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

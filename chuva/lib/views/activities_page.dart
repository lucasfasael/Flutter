import 'package:chuva/widgets/person.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff456189),
        title: const Text(
          "Chuva 💜Flutter",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFC24FFE),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Astrofísica e Cosmologia",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 160,
              child: Column(
                children: [
                  const Flexible(
                    child: Text(
                      "A Física dos Buracos Negros Supermassivos ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.alarm_rounded,
                              color: Color(0xFF306DC3),
                            ),
                            Text("Domingo 07:00h - 08:00h")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(0xFF306DC3),
                            ),
                            Text("Maputo")
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF306DC3), // Background color
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Details()),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(Icons.star),
                        ),
                        Text(
                          "Adicionar à sua agenda",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 480,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Flexible(
                    child: Text(
                        "A física dos buracos negros supermassivos explora fenômenos intensos e enigmáticos no universo. Esses objetos astronômicos, com milhões a bilhões de vezes a massa do Sol, influenciam fortemente sua vizinhança cósmica, afetando a evolução das galáxias, e desafiando nossos entendimento sobre gravidade e a natureza do espaço-tempo."),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Palestrante",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView(
                          children: const [
                            Palestrante(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tinder_anime/screens/widgets/AnimeWidget.dart';

class HomeScreen extends StatefulWidget {
  final Function(Anime) popAnime;

  const HomeScreen({Key? key, required this.popAnime}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Anime> animes = [];

Anime addAnime(Anime anime) {
  animes.add(anime);

  return anime;
}

class _HomeScreenState extends State<HomeScreen> {
  void removeAnime(Anime anime) {
    setState(() {
      animes.remove(anime);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(230, 160, 9, 9),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/add_screen");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_box,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10), // Espaçamento entre o ícone e o texto
                    Text(
                      "Adicionar anime",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(220, 160, 9, 9),
        title: Center(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "./assets/anime_logo.ico",
                  alignment: Alignment.center,
                  width: 45,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Anime",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(115, 68, 66, 66),
        child: Center(
          child: Container(
            width: width * 0.9,
            height: height * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(220, 160, 9, 9),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(80, 223, 27, 13),
                  blurRadius: 15,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              children: animes.length > 0
                  ? animes
                  : [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Você visualizou todos os animes, tente novamente mais tarde !",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              width: width * 0.9,
                              child: Image.asset(
                                "assets/end_sad.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
            ),
          ),
        ),
      ),
    );
  }
}

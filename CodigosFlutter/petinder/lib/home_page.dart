import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:petinder/dog_entity.dart';
import 'package:petinder/msg_end.dart';

import 'perfil_dog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  List<DogEntity> dogs = [
    // DogEntity(
    //   id: "1",
    //   nome: "Ayla",
    //   image:
    //       "https://i.pinimg.com/originals/b9/5c/d8/b95cd891ad076b65d549b744d16270da.jpg",
    //   sexo: "F",
    //   raca: "Husky",
    // ),
    // DogEntity(
    //   id: "2",
    //   nome: "Thor",
    //   image: "https://www.loveforpet.com.br/servicos/img/grande/lulu_foto.jpg",
    //   sexo: "M",
    //   raca: "Lulu",
    // ),
  ];

  @override
  void initState() {
    onLoadPage();
    super.initState();
  }

  onLoadPage() async {
    var resultado = await dio.get("http://192.168.101.7:8080/api/petinder");
    setState(() {
      dogs.clear();
      dogs.addAll((resultado.data as List).map((e) => DogEntity.fromMap(e)));
    });
  }

  @override
  Widget build(BuildContext context) {
    //debugInvertOversizedImages = true;

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 80.0),
          child: Row(
            children: [
              const Icon(
                Icons.pets,
                color: Colors.amber,
              ),
              Text(
                widget.title,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        //Simplificado com apenas um variável em vez de todas
        children: [
          const Center(
            child: Msg(),
          ),
          ...dogs.reversed
              .map(
                (e) => PerfilDog(
                  dogEntity: e,
                  actionLike: () {
                    setState(() {
                      dogs.remove(e);
                    });
                  },
                  actionDislike: () {},
                ),
              )
              .toList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:petinder/dog_entity.dart';
import 'package:petinder/match_screen.dart';
import 'package:petinder/msg_end.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'perfil_dog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var boolValue;
  int opcaoSelecionada = 0;
  final dio = Dio();
  List<DogEntity> dogsMatchs = [];
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
    var resultado = await dio
        .get("https://474b-187-84-179-171.ngrok-free.app/api/petinder");
    setState(() {
      dogs.clear();
      dogs.addAll((resultado.data as List).map((e) => DogEntity.fromMap(e)));
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //debugInvertOversizedImages = true;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.pets,
              color: Colors.amber,
            ),
            Text(
              widget.title,
            ),
            const SizedBox(
              width: 50,
            ),
          ],
        ),
      ),
      drawer: Drawer(
          backgroundColor: Colors.amber[800],
          child: Center(
            child: ListTile(
              leading: const Icon(
                Icons.favorite,
                size: 40,
                color: Colors.red,
              ),
              title: const Text(
                "Sobre",
                style: TextStyle(
                  fontSize: 35,
                ),
                textAlign: TextAlign.center,
              ),
              trailing: const Icon(
                Icons.arrow_forward,
                size: 40,
              ),
              onTap: () {
                Navigator.of(context).pushNamed("sobre");
              },
            ),
          )),
      body: IndexedStack(
        index: opcaoSelecionada,
        children: <Widget>[
          Stack(
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
                          boolValue = Random().nextBool();
                          if (boolValue == true) {
                            dogsMatchs.add(e);
                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.success(
                                message:
                                    "Parabéns, você tem um novo match com ${e.nome} !!",
                              ),
                            );
                          } else {
                            print("Falso");
                          }
                          dogs.remove(e);
                        });
                      },
                      actionDislike: () {
                        setState(() {
                          dogs.remove(e);
                        });
                      },
                    ),
                  )
                  .toList(),
            ],
          ),
          ListView(
            children: dogsMatchs
                .map(
                  (e) => Match(
                    dogEntity: e,
                  ),
                )
                .toList(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: opcaoSelecionada,
        onTap: (opcao) {
          setState(() {
            opcaoSelecionada = opcao;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Matches',
          ),
        ],
      ),
    );
  }
}

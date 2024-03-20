import 'package:flutter/material.dart';
import 'package:tinder_anime/screens/HomeScreen.dart';

import 'widgets/AnimeWidget.dart';

class AddScreen extends StatefulWidget {
  final Function(Anime) addAnime;

  const AddScreen({Key? key, required this.addAnime}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool valueValidator(String? value) {
    return value?.isEmpty ?? true;
  }

  bool descriptionValidator(String? description) {
    return description?.isEmpty ?? true;
  }

  bool urlValidator(String? url) {
    return url?.isEmpty ?? true;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/itachi4.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Form(
              key: _formKey,
              child: Container(
                width: width * 0.95,
                height: height * 0.55,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(220, 160, 9, 9),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome da Tarefa';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (url) {
                        if (urlValidator(url)) {
                          return 'Insira uma URL para a imagem';
                        }
                        return null;
                      },
                      controller: urlController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem URL',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (description) {
                        if (descriptionValidator(description)) {
                          return 'Insira uma descrição válida !';
                        }
                        return null;
                      },
                      controller: descriptionController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Descrição do anime',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.black), // Define a cor de fundo do botão
                        minimumSize: MaterialStateProperty.all<Size>(
                            Size(200, 50)), // Define o tamanho mínimo do botão
                      ),
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Criando uma nova Tarefa'),
                              ),
                            );
                            Anime anime = Anime(
                              name: nameController.text,
                              url: urlController.text,
                              description: descriptionController.text,
                            );

                            widget.addAnime(anime);
                            Navigator.popAndPushNamed(context, "/");
                          }
                        });
                      },
                      child: Text(
                        'Adicionar!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  bool valueValidator(String? value) {
    return value?.isEmpty ?? true;
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
                height: height * 0.5,
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem URL',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Criando uma nova Tarefa'),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Adicionar!',
                        style: TextStyle(color: Colors.black),
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

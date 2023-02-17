import 'package:alura_flutter_curso_1/data/task_generator.dart';
import 'package:flutter/material.dart';

class TaskGen extends StatefulWidget {
  const TaskGen({super.key, required this.taskContext});

  final BuildContext taskContext;
  @override
  State<TaskGen> createState() => _TaskGenState();
}

class _TaskGenState extends State<TaskGen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController nivelController = TextEditingController();

  TextEditingController urlController = TextEditingController();

  bool isNotValid(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool nValidator(String? value) {
    if (value != null) {
      if (value.isEmpty || int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15)),
              width: 375,
              height: 650,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (isNotValid(value)) {
                          return 'Insira um nome para sua tarefa !';
                        }
                        return null;
                      },
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Nome'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (nValidator(value)) {
                          return 'Digite uma dificuldade entre 1 e 5';
                        }
                        return null;
                      },
                      controller: nivelController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Dificuldade'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (isNotValid(value)) {
                          return 'Insira uma URL de imagem para essa tarefa !';
                        }
                        return null;
                      },
                      controller: urlController,
                      keyboardType: TextInputType.url,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'URL'),
                    ),
                  ),
                  Container(
                    width: 72,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8)),
                    child: isNotValid(urlController.text)
                        ? ClipRRect(
                            child: Image.asset('assets/images/no_Photo.png'),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              urlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        TaskGenerator.of(widget.taskContext)?.gerador(
                            nameController.text,
                            int.parse(nivelController.text),
                            urlController.text);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Adicionar !'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

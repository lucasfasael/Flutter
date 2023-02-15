import 'package:flutter/material.dart';

class TaskGen extends StatefulWidget {
  TaskGen({super.key});

  @override
  State<TaskGen> createState() => _TaskGenState();
}

class _TaskGenState extends State<TaskGen> {
  Key formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController nivelController = TextEditingController();

  TextEditingController urlController = TextEditingController();

  bool isValid(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nova Tarefa'),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black26,
                border: Border.all(),
                borderRadius: BorderRadius.circular(15)),
            width: 375,
            height: 620,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (isValid(value)) {
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
                  child: ClipRRect(
                    child: Image.asset('assets/images/no_Photo.png'),
                  ),
                  width: 72,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8)),
                ),
                ElevatedButton(
                  onPressed: () {
                    print(nameController.text);
                    print(nivelController.text);
                    print(urlController.text);
                  },
                  child: Text('Adicionar !'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

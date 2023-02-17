import 'package:alura_flutter_curso_1/screens/task.dart';
import 'package:flutter/material.dart';

import '../data/task_generator.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter: Primeiros Passos'),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (newContext) => TaskGen(
                    taskContext: context,
                  ),
                ));
          },
          child: const Icon(Icons.add_task),
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Container(
          color: const Color.fromARGB(255, 208, 221, 237),
          child: ListView(
            padding: const EdgeInsets.only(top: 8, bottom: 70),
            children: TaskGenerator.of(context)!.taskList,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: Colors.blue[100],
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}

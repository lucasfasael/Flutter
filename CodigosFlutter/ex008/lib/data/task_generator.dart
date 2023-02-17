import 'package:alura_flutter_curso_1/components/tasks.dart';
import 'package:flutter/material.dart';

class TaskGenerator extends InheritedWidget {
  TaskGenerator({super.key, required Widget child}) : super(child: child);

  final List<Tasks> taskList = [
    Tasks('Estudar Flutter', 'assets/images/flutter.png', 3),
    Tasks('Andar de Bike', 'assets/images/bike.webp', 2),
    Tasks('Ler 50 páginas', 'assets/images/ler.jpg', 1),
    Tasks('Meditar', 'assets/images/meditar.jpeg', 4),
    Tasks('Jogar', 'assets/images/jogar.jpg', 0),
  ];

  Tasks? gerador(String nome, int dificuldade, String url) {
    taskList.add(Tasks(nome, url, dificuldade));
    return null;
  }

  static TaskGenerator? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskGenerator>();
  }

  @override
  bool updateShouldNotify(TaskGenerator oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}

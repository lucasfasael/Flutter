import 'package:flutter/material.dart';

import '../components/tasks.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required Widget child}) : super(child: child);

  final List<Tasks> taskList = [
    Tasks('Estudar Flutter', 'assets/images/flutter.png', 3),
    Tasks('Andar de Bike', 'assets/images/bike.webp', 2),
    Tasks('Ler 50 páginas', 'assets/images/ler.jpg', 1),
    Tasks('Meditar', 'assets/images/meditar.jpeg', 4),
    Tasks(
        'Jogar',
        'https://br.norton.com/content/dam/norton/backgrounds/image_male_gamer_pc_mobile_2x.jpg',
        1),
  ];

  void newTask(String name, String URL, int dificuldade) {
    taskList.add(Tasks(name, URL, dificuldade));
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}

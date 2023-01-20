import 'package:flutter/material.dart';
import '../widgets/task.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Tarefas',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView(
        children: [
          Task(
            'Aprender Flutter tomando café',
            "assets/images/DashFlutter.png",
          ),
          Task('Jogar', "assets/images/fliperama.jpg"),
          Task('Meditar', "assets/images/DashFlutter.png"),
          Task('Aprender Flutter', "assets/images/DashFlutter.png"),
          Task('Jogar', "assets/images/DashFlutter.png"),
          Task('Meditar', "assets/images/DashFlutter.png")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.remove_red_eye),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
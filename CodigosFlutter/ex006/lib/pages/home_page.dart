import 'package:flutter/material.dart';
import '../widgets/task.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool op = true;

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
      body: AnimatedOpacity(
        opacity: op ? 1 : 0,
        duration: Duration(milliseconds: 800),
        child: ListView(
          children: [
            Task('Aprender Flutter tomando café',
                "assets/images/DashFlutter.png", 3),
            Task('Jogar', "assets/images/fliperama.jpg", 1),
            Task('Meditar', "assets/images/DashFlutter.png", 5),
            Task('Aprender Flutter', "assets/images/DashFlutter.png", 4),
            Task('Jogar', "assets/images/DashFlutter.png", 1),
            Task('Meditar', "assets/images/DashFlutter.png", 5)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            op = !op;
          });
        },
        child: Icon(Icons.remove_red_eye),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

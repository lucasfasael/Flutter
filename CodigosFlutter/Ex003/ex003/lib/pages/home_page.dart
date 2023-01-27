import 'package:ex003/pages/models/task_model.dart';
import 'package:flutter/material.dart';
import '../widgets/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool opacidade = true;
  List<TaskModel> tarefas = [];

  adicionaTarefas() {
    setState(() {
      TaskModel tarefa = TaskModel();
      tarefa.nome = 'Aprender Flutter';
      tarefa.imagemUrl =
          'https://pbs.twimg.com/media/FSgl1OfUcAEsiQV.jpg:large';
      tarefa.nivelDificuldade = 1;
      tarefas.add(tarefa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                GestureDetector(onTap: adicionaTarefas, child: Icon(Icons.add)),
          )
        ],
      ),
      drawer: const Drawer(backgroundColor: Colors.amber),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: tarefas
              .map((e) => Task(e.nome, e.imagemUrl, e.nivelDificuldade))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.remove_red_eye),
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
      ),
    );
  }
}

// [
//             const Task('Aprender Flutter todos os dias',
//                 'https://pbs.twimg.com/media/FSgl1OfUcAEsiQV.jpg:large', 3),
//             const Task(
//                 'Andar de Bike',
//                 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/d397d35c-c842-4776-9d23-5e40febe714b/dayqpl2-7da3fd61-7876-405a-9131-53237fbbfe1b.png/v1/crop/w_252,h_350,x_0,y_0,scl_0.19474497681607,strp/love_squared_by_glee_chan_dayqpl2-350t.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTQyNSIsInBhdGgiOiJcL2ZcL2QzOTdkMzVjLWM4NDItNDc3Ni05ZDIzLTVlNDBmZWJlNzE0YlwvZGF5cXBsMi03ZGEzZmQ2MS03ODc2LTQwNWEtOTEzMS01MzIzN2ZiYmZlMWIucG5nIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.kCPLsz12DUQOyAaaIDq_UTld2I9u5XWpPQ-aa6QmusY',
//                 2),
//             const Task(
//                 'Abraçar Duda',
//                 'https://scontent.faju2-1.fna.fbcdn.net/v/t1.6435-9/132047699_665388757465390_3106435346266009801_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=174925&_nc_eui2=AeHObO6AyihlvgWiqma3s23V5NTCrqqni3Xk1MKuqqeLdWRMKFilkn-w13u0UULbf95N71hHv3rQ_r4HLmNOOMSs&_nc_ohc=3D7Ens_vjMMAX8UO4Xs&_nc_ht=scontent.faju2-1.fna&oh=00_AfDcsx_De0YPjzVihsR7OqYT5xVn4ZCJ1QZOSgh9YCeYyg&oe=63B82BDD',
//                 5),
//             const Task('Beber água',
//                 'https://pbs.twimg.com/media/D92bx3EW4AEZDHK.jpg', 1),
//             const Task(
//                 'Meditar',
//                 'http://1.bp.blogspot.com/-cbgL1WaTxlk/UkhijoDF2XI/AAAAAAAAAbw/m_20Ryu9eX4/s1600/%C3%94mega-Shiryu.jpg',
//                 4),
//             const Task(
//                 'Jogar',
//                 'https://static.vecteezy.com/system/resources/previews/002/096/920/original/the-arcade-machine-stopped-working-and-a-sign-was-closed-on-it-flat-illustration-vector.jpg',
//                 1),
//           ]
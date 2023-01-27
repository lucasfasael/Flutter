import 'package:flutter/material.dart';
import 'difficulty.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Tarefas')),
        drawer: const Drawer(backgroundColor: Colors.amber),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: const Duration(milliseconds: 800),
          child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Task('Aprender Flutter todos os dias',
                  'https://pbs.twimg.com/media/FSgl1OfUcAEsiQV.jpg:large', 3),
              const Task(
                  'Andar de Bike',
                  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/d397d35c-c842-4776-9d23-5e40febe714b/dayqpl2-7da3fd61-7876-405a-9131-53237fbbfe1b.png/v1/crop/w_252,h_350,x_0,y_0,scl_0.19474497681607,strp/love_squared_by_glee_chan_dayqpl2-350t.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTQyNSIsInBhdGgiOiJcL2ZcL2QzOTdkMzVjLWM4NDItNDc3Ni05ZDIzLTVlNDBmZWJlNzE0YlwvZGF5cXBsMi03ZGEzZmQ2MS03ODc2LTQwNWEtOTEzMS01MzIzN2ZiYmZlMWIucG5nIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.kCPLsz12DUQOyAaaIDq_UTld2I9u5XWpPQ-aa6QmusY',
                  2),
              const Task(
                  'Abraçar Duda',
                  'https://scontent.faju2-1.fna.fbcdn.net/v/t1.6435-9/132047699_665388757465390_3106435346266009801_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=174925&_nc_eui2=AeHObO6AyihlvgWiqma3s23V5NTCrqqni3Xk1MKuqqeLdWRMKFilkn-w13u0UULbf95N71hHv3rQ_r4HLmNOOMSs&_nc_ohc=3D7Ens_vjMMAX8UO4Xs&_nc_ht=scontent.faju2-1.fna&oh=00_AfDcsx_De0YPjzVihsR7OqYT5xVn4ZCJ1QZOSgh9YCeYyg&oe=63B82BDD',
                  5),
              const Task('Beber água',
                  'https://pbs.twimg.com/media/D92bx3EW4AEZDHK.jpg', 1),
              const Task(
                  'Meditar',
                  'http://1.bp.blogspot.com/-cbgL1WaTxlk/UkhijoDF2XI/AAAAAAAAAbw/m_20Ryu9eX4/s1600/%C3%94mega-Shiryu.jpg',
                  4),
              const Task(
                  'Jogar',
                  'https://static.vecteezy.com/system/resources/previews/002/096/920/original/the-arcade-machine-stopped-working-and-a-sign-was-closed-on-it-flat-illustration-vector.jpg',
                  1),
            ],
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
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.blue),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(fontSize: 24),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Difficulty(
                          dificuldade: widget.dificuldade,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 80,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: (() {
                            setState(() {
                              nivel++;
                            });
                          }),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text('Lvl Up')
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        color: const Color.fromARGB(255, 189, 14, 1),
                        value: (nivel / widget.dificuldade) / 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nivel: $nivel',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 251, 251, 0),
                          fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:ex006/widgets/dificulty.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String img;
  final int dificuldade;

  Task(this.nome, this.img, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8)),
            height: 132,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 240, 235, 235),
                    borderRadius: BorderRadius.circular(8)),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(95, 68, 65, 65),
                          borderRadius: BorderRadius.circular(8)),
                      height: 100,
                      width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          widget.img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 200,
                      child: Container(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.nome,
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Dificulty(widget.dificuldade)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text("Lvl Up"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: (widget.dificuldade) > 0
                            ? (nivel / widget.dificuldade) / 10
                            : 1,
                        backgroundColor: Color.fromARGB(255, 250, 237, 237),
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      'Nível: $nivel',
                      style: TextStyle(color: Colors.yellowAccent),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

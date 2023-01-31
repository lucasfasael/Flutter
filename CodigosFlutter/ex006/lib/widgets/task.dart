import 'package:ex006/widgets/dificulty.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String img;
  final int dificuldade;

  const Task(this.nome, this.img, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  int contadorCor = 0;
  List<Color> listaDeCores = [
    Colors.black,
    Colors.purple,
    Colors.yellow,
    Colors.green,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: listaDeCores[contadorCor],
              borderRadius: BorderRadius.circular(8),
            ),
            height: 132,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 240, 235, 235),
                    borderRadius: BorderRadius.circular(8)),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(95, 68, 65, 65),
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
                    SizedBox(
                      height: 100,
                      width: 200,
                      child: SizedBox(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.nome,
                              style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Dificulty(widget.dificuldade)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (nivel < (widget.dificuldade * 10)) {
                              nivel++;
                            } else {
                              nivel = 0;
                              contadorCor = contadorCor + 1;
                              if (contadorCor > 3) {
                                contadorCor = 0;
                              }
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
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
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: (widget.dificuldade) > 0
                            ? (nivel / widget.dificuldade) / 10
                            : 1,
                        backgroundColor:
                            const Color.fromARGB(255, 250, 237, 237),
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      'Nível: $nivel',
                      style: const TextStyle(color: Colors.yellowAccent),
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

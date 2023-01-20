import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String img;
  Task(this.nome, this.img, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  String img = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            color: Colors.blueAccent,
            height: 132,
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Color.fromARGB(95, 68, 65, 65),
                      height: 100,
                      width: 70,
                      child: Image.asset(
                        widget.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        height: 100,
                        width: 200,
                        child: Center(
                            child: Container(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ))),
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
                        value: nivel / 10,
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

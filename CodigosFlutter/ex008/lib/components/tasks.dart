import 'package:flutter/material.dart';

import 'difficulty.dart';

class Tasks extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Tasks(this.nome, this.foto, this.dificuldade, {Key? key}) : super(key: key);

  int level = 1;
  int contColor = 0;
  List<Color> colorList = [
    Colors.blue,
    const Color.fromARGB(255, 4, 113, 202),
    Colors.amberAccent,
    const Color.fromARGB(255, 187, 141, 4),
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.black
  ];
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  void levelUp() {
    setState(() {
      if (widget.level < (widget.dificuldade * 10)) {
        widget.level++;
      } else {
        widget.level = 0;
        if (widget.contColor < 7) {
          widget.contColor++;
        } else {
          widget.contColor = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: widget.colorList[widget.contColor],
              ),
              height: 140,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 72,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black12,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: widget.foto.contains('http')
                              ? Image.network(
                                  widget.foto,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
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
                              style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Difficulty(widget.dificuldade),
                          // vai ser um novo componente.
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          height: 52,
                          width: 52,
                          child: ElevatedButton(
                            onPressed: levelUp,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  'UP',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: widget.dificuldade > 0
                              ? ((widget.level / widget.dificuldade) / 10)
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Nivel: ${widget.level}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

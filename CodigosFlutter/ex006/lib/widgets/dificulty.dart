import 'package:flutter/material.dart';

class Dificulty extends StatelessWidget {
  final int dificuldade;

  const Dificulty(this.dificuldade, {super.key});
    
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: (dificuldade) >= 1 ? Colors.amber : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          color: (dificuldade) >= 2 ? Colors.amber : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          color: (dificuldade) >= 3 ? Colors.amber : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          color: (dificuldade) >= 4 ? Colors.amber : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          color: (dificuldade) >= 5 ? Colors.amber : Colors.blue[100],
        ),
      ],
    );
  }
}

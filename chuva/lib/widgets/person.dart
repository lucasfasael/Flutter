import 'package:flutter/material.dart';

class Palestrante extends StatefulWidget {
  const Palestrante({super.key});

  @override
  State<Palestrante> createState() => _PalestranteState();
}

class _PalestranteState extends State<Palestrante> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).popAndPushNamed("perfil");
      },
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://static.todamateria.com.br/upload/st/ep/stepheazul.jpg",
                ),
              ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Stephen William Hawking",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Universidade de Cambridge",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

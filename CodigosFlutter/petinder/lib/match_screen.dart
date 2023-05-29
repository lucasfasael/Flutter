import 'package:flutter/material.dart';
import 'package:petinder/dog_entity.dart';

class Match extends StatelessWidget {
  // poderia usar variável por variável, teria que atribuir o E do Map um por um.
  final DogEntity dogEntity;

  const Match({
    super.key,
    required this.dogEntity,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("chat");
        },
        child: Container(
          height: height / 11,
          width: width,
          decoration: BoxDecoration(
            color: Colors.amber[800],
            border: Border.all(width: 0.8),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width / 3.5,
                height: height / 11,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(30)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    dogEntity.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                dogEntity.raca,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  dogEntity.nome,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

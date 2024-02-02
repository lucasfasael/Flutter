import 'package:flutter/material.dart';
import 'package:petinder/dog_entity.dart';

class PerfilDog extends StatelessWidget {
  // poderia usar variável por variável, teria que atribuir o E do Map um por um.
  final DogEntity dogEntity;

  //Ações:
  final void Function() actionLike;
  final void Function() actionDislike;

  const PerfilDog({
    super.key,
    required this.dogEntity,
    required this.actionLike,
    required this.actionDislike,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 198, 185, 185),
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
          ),
          width: width * 0.9,
          height: height * 0.72,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: width * 0.9,
                    height: height * 0.6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }

                          if (loadingProgress.cumulativeBytesLoaded <
                              loadingProgress.expectedTotalBytes!) {
                            return SizedBox(
                                height: 200,
                                width: 200,
                                child:
                                    Center(child: CircularProgressIndicator()));
                          }
                          return child;
                        },
                        //loadingBuilder: (context, child, loadingProgress) {
                        //loadingProgress.expectedTotalBytes
                        //return const CircularProgressIndicator();
                        //return child;
                        //},
                        //cacheWidth: (width * 0.9) ~/ 0.9,
                        //cacheHeight: (height * 0.6) ~/ 1.5,
                        dogEntity.image,
                        fit: BoxFit.cover, //
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(94, 158, 158, 158),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(top: height * 0.48),
                      height: height * 0.1,
                      width: width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                dogEntity.nome,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                  fontStyle: FontStyle.italic,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              dogEntity.sexo == "M"
                                  ? const Icon(
                                      Icons.male,
                                      color: Colors.blue,
                                    )
                                  : const Icon(
                                      Icons.female_rounded,
                                      color: Colors.red,
                                    )
                            ],
                          ),
                          Text(
                            "(${dogEntity.raca})",
                            style: const TextStyle(color: Colors.yellowAccent),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: width * 0.9,
                  height: height * 0.065,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(204, 252, 245, 245),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: actionDislike,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: actionLike,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.lightBlueAccent, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.star,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: actionLike,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

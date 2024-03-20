import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tinder_anime/screens/HomeScreen.dart';

class Anime extends StatefulWidget {
  final String name;
  final String url;
  final String description;

  const Anime(
      {required this.name,
      required this.url,
      required this.description,
      super.key});

  @override
  State<Anime> createState() => _AnimeState();
}

class _AnimeState extends State<Anime> {
  bool _showLoader = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _showLoader = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: width * 0.9,
        color: Color.fromARGB(220, 160, 9, 9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: _showLoader
                      ? SizedBox(
                          width: width * 0.9,
                          height: height * 0.7,
                          child: Center(
                            child: Transform.scale(
                              scale: 5.0,
                              child: const CircularProgressIndicator(
                                color: Colors.blue,
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        )
                      : Image.network(
                          widget.url,
                          width: width * 0.9,
                          height: height * 0.7,
                          fit: BoxFit.cover,
                        ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              actionsAlignment: MainAxisAlignment.center,
                              backgroundColor:
                                  const Color.fromARGB(220, 160, 9, 9),
                              title: Text(
                                widget.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              content: Text(
                                widget.description,
                                style: TextStyle(color: Colors.white),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black)),
                                  child: Text(
                                    'Fechar',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.info,
                          size: 50,
                          color: Colors.amberAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.9,
                      height: height * 0.6,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Container(
                            width: width * 0.35,
                            height: height * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(183, 0, 0, 0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                widget.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: width * 0.9,
              height: height * 0.1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(207, 255, 255, 255),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 255, 17, 0),
                          size: 30,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 32, 54, 255),
                          size: 30,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Color.fromARGB(255, 177, 6, 168),
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              animes.removeLast();
                              Navigator.popAndPushNamed(context, "/");
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

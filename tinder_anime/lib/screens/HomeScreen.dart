import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dio = Dio();
  String imageUrl = "";
  List<String> images = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }

  void getHttp() async {
    final response = await dio.get('https://nekos.pro/api/neko/');

    print("DIO TESTE --------------------");
    setState(() {
      imageUrl = response.data["url"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(230, 160, 9, 9),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/add_screen");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_box,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10), // Espaçamento entre o ícone e o texto
                    Text(
                      "Adicionar anime",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(220, 160, 9, 9),
        title: Center(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "./assets/anime_logo.ico",
                  alignment: Alignment.center,
                  width: 45,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Anime",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(115, 68, 66, 66),
        child: Center(
          child: Container(
            width: width * 0.9,
            height: height * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(220, 160, 9, 9),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(80, 223, 27, 13),
                  blurRadius: 15,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: imageUrl.isEmpty
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
                              "$imageUrl",
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.info,
                            size: 50,
                            color: Colors.amberAccent,
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
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Neko",
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5),
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
                                  getHttp();
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
        ),
      ),
    );
  }
}

import 'package:chuva/widgets/activity.dart';
import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Profile(title: 'Flutter Demo Home Page'),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key, required this.title});

  final String title;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: PixelPerfect(
        offset: const Offset(2, -52),
        assetPath: "assets/home.jpeg",
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 69, 97, 137),
            title: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chuva 💜 Flutter',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Programação",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            centerTitle: true,
          ),
          body: Material(
            elevation: 4,
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: const Color.fromARGB(255, 69, 97, 137),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFAFAFA),
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(30)),
                        width: double.maxFinite,
                        height: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: 40,
                                height: 30,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF306DC3),
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Icon(Icons.calendar_month)),
                            const Text("Exibindo todas as atividades")
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        child: Row(
                          children: [
                            Container(
                              width: 45,
                              height: 44,
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {},
                                child: Ink(
                                  child: const Center(
                                    child: Text(
                                      "Nov\n2023",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 45,
                              height: 44,
                              color: Colors.blue,
                              child: InkWell(
                                onTap: () {},
                                child: Ink(
                                  child: Center(
                                    child: Text(
                                      "26",
                                      style: TextStyle(
                                        color: Colors.grey[350],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 45,
                              height: 44,
                              color: Colors.blue,
                              child: InkWell(
                                onTap: () {},
                                child: Ink(
                                  child: Center(
                                    child: Text(
                                      "27",
                                      style: TextStyle(
                                        color: Colors.grey[350],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 45,
                              height: 44,
                              color: Colors.blue,
                              child: InkWell(
                                onTap: () {},
                                child: Ink(
                                  child: Center(
                                    child: Text(
                                      "28",
                                      style: TextStyle(
                                        color: Colors.grey[350],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 45,
                              height: 44,
                              color: Colors.blue,
                              child: InkWell(
                                onTap: () {},
                                child: Ink(
                                  child: Center(
                                    child: Text(
                                      "29",
                                      style: TextStyle(
                                        color: Colors.grey[350],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 45,
                              height: 44,
                              color: Colors.blue,
                              child: InkWell(
                                onTap: () {},
                                child: Ink(
                                  child: Center(
                                    child: Text(
                                      "30",
                                      style: TextStyle(
                                        color: Colors.grey[350],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.95,
                  height: height * 0.7,
                  child: ListView(
                    children: const [
                      Activity(),
                      Activity(),
                      Activity(),
                      Activity(),
                      Activity(),
                      Activity(),
                      Activity(),
                      Activity(),
                    ],
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

import 'package:chuva/views/activities_page.dart';
import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(10)),
        width: double.maxFinite,
        height: 80,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Details()),
            );
          },
          child: Row(
            children: [
              Container(
                width: 8,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.purple,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Palestra de 08:00 até 09:00"),
                    Text("O Cenário Multiverso: Uma Exploração"),
                    Text("Cosmológica e Filosófica")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

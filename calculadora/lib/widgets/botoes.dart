import 'dart:ui';

import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  const Botoes({
    Key? key,
    this.soma,
    this.subtracao,
    this.onTapNumber,
    this.multiplicacao,
    this.divisao,
    this.porcent,
    this.clear,
    this.reverso,
    this.igual,
  }) : super(key: key);

  final Function()? soma;
  final Function()? subtracao;
  final Function()? multiplicacao;
  final Function()? divisao;
  final Function()? porcent;
  final Function(String)? onTapNumber;
  final Function()? clear;
  final Function()? reverso;
  final Function()? igual;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.5,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: "clear",
                  onPressed: clear,
                  child: Text(
                    "C",
                    style: TextStyle(fontSize: 35),
                  )),
              FloatingActionButton(
                heroTag: "reverso",
                  onPressed: reverso,
                  child: Text(
                    "+/-",
                    style: TextStyle(fontSize: 35),
                  )),
              FloatingActionButton(
                heroTag: "porcent",
                  onPressed: porcent,
                  child: Text(
                    "%",
                    style: TextStyle(fontSize: 35),
                  )),
              FloatingActionButton(
                heroTag: "divisao",
                  onPressed: divisao,
                  child: Text(
                    "÷",
                    style: TextStyle(fontSize: 35),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: "onTapNumber7",
                  onPressed: () {
                    onTapNumber!("7");
                  },
                  child: Text(
                    "7",
                    style: TextStyle(fontSize: 35),
                  )),
              FloatingActionButton(
                heroTag: "onTapNumber8",
                  onPressed: () {
                    onTapNumber!("8");
                  },
                  child: Text(
                    "8",
                    style: TextStyle(fontSize: 35),
                  )),
              FloatingActionButton(
                heroTag: "onTapNumber9",
                  onPressed: () {
                    onTapNumber!("9");
                  },
                  child: Text(
                    "9",
                    style: TextStyle(fontSize: 35),
                  )),
              FloatingActionButton(
                heroTag: "multiplicacao",
                  onPressed: multiplicacao,
                  child: Text(
                    "X",
                    style: TextStyle(fontSize: 35),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: "onTapNumber4",
                  onPressed: () {
                    onTapNumber!("4");
                  },
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 35),
                  )),
              FloatingActionButton(
                heroTag: "onTapNumber5",
                  onPressed: () {
                    onTapNumber!("5");
                  },
                  child: Text(
                    "5",
                    style: TextStyle(fontSize: 35),
                  )),
              FloatingActionButton(
                heroTag: "onTapNumber6",
                  onPressed: () {
                    onTapNumber!("6");
                  },
                  child: Text(
                    "6",
                    style: TextStyle(fontSize: 35),
                  )),
              FloatingActionButton(
                heroTag: "subtracao",
                  onPressed: subtracao,
                  child: Text(
                    "-",
                    style: TextStyle(fontSize: 35),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: "onTapNumber1",
                  onPressed: () {
                    onTapNumber!("1");
                  },
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 35),
                  )),
              FloatingActionButton(
                heroTag: "onTapNumber2",
                  onPressed: () {
                    onTapNumber!("2");
                  },
                  child: Text(
                    "2",
                    style: TextStyle(fontSize: 35),
                  )),
              FloatingActionButton(
                heroTag: "onTapNumber3",
                  onPressed: () {
                    onTapNumber!("3");
                  },
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 35),
                  )),
              FloatingActionButton(
                heroTag: "soma",
                  onPressed: soma,
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 35),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: "onTapNumber0",
                  onPressed: () {
                    onTapNumber!("0");
                  },
                  child: Text(
                    "0",
                    style: TextStyle(fontSize: 35),
                  )),
              FloatingActionButton(
                heroTag: "onTapNumber.",
                  onPressed: () {
                    onTapNumber!(".");
                  },
                  child: Text(
                    ".",
                    style: TextStyle(fontSize: 35),
                  )),
              ElevatedButton(
                onPressed: igual,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(160, 70),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
                child: const Text(
                  "=",
                  style: TextStyle(fontSize: 35),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

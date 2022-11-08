import 'package:flutter/material.dart';

import 'widgets/botoes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String operacao = "";
  String valorFinal = '0';
  double n1 = 0;
  double n2 = 0;
  double n3 = 0;
  bool igualBool = false;

  soma() {
    if (operacao != "+" || igualBool == true) {
      operacao = "+";
      n1 = double.parse(valorFinal);
      n2 = 0;
      valorFinal = "0";
    } else {
      operacao = "+";
      n2 = double.parse(valorFinal);
      n3 = n1 + n2;
      valorFinal = n3.toString();
      n1 = double.parse(valorFinal);
      valorFinal = "0";
      n2 = 0;
    }
    igualBool = false;
    setState(() {});
  }

  subtracao() {
    if (operacao != "-" || igualBool == true) {
      operacao = "-";
      n1 = double.parse(valorFinal);
      n2 = 0;
      valorFinal = "0";
    } else {
      operacao = "-";
      n2 = double.parse(valorFinal);
      n3 = n1 - n2;
      valorFinal = n3.toString();
      n1 = double.parse(valorFinal);
      valorFinal = "0";
      n2 = 0;
    }
    setState(() {});
  }

  multiplicacao() {
    if (operacao != "X" || igualBool == true) {
      operacao = "X";
      n1 = double.parse(valorFinal);
      n2 = 0;
      valorFinal = "0";
    } else {
      operacao = "X";
      n2 = double.parse(valorFinal);
      n3 = n1 * n2;
      valorFinal = n3.toString();
      n1 = double.parse(valorFinal);
      valorFinal = "0";
      n2 = 0;
    }
    igualBool = false;
    setState(() {});
  }

  divisao() {
    if (operacao != "÷" || igualBool == true) {
      operacao = "÷";
      n1 = double.parse(valorFinal);
      n2 = 0;
      valorFinal = "0";
    } else {
      operacao = "÷";
      n2 = double.parse(valorFinal);
      n3 = n1 / n2;
      valorFinal = n3.toString();
      n1 = double.parse(valorFinal);
      valorFinal = "0";
      n2 = 0;
    }
    igualBool = false;
    setState(() {});
  }

  porcent() {
    if (operacao == "+" && valorFinal[0] != "0") {
      n2 = double.parse(valorFinal);
      valorFinal = (n1 * (double.parse(valorFinal) * 0.01) + n1).toString();
      n1 = 0;
      n2 = 0;
      operacao = "";
      igualBool = false;
    }
    if (operacao == "-" && valorFinal[0] != "0") {
      n2 = double.parse(valorFinal);
      valorFinal = (n1 - (n1 * (double.parse(valorFinal) * 0.01))).toString();
      n1 = 0;
      n2 = 0;
      operacao = "";
      igualBool = false;
    }

    setState(() {});
  }

  igual() {
    if (n1 != 0 || igualBool == true) {
      if (operacao == "+") {
        if (igualBool == false) {
          n2 = double.parse(valorFinal);
          valorFinal = (double.parse(valorFinal) + n1).toString();
        } else {
          n1 = n1 + n2;
          valorFinal = (double.parse(valorFinal) + n2).toString();
        }
        igualBool = true;
      }
      if (operacao == "-") {
        if (igualBool == false) {
          n2 = double.parse(valorFinal);
          valorFinal = (n1 - n2).toString();
        } else {
          n1 = n1 - n2;
          valorFinal = (double.parse(valorFinal) - n2).toString();
        }
        igualBool = true;
      }
      if (operacao == "X") {
        if (igualBool == false) {
          n2 = double.parse(valorFinal);
          valorFinal = (double.parse(valorFinal) * n1).toString();
        } else {
          n1 = n1 * n2;
          valorFinal = (double.parse(valorFinal) * n2).toString();
        }
        igualBool = true;
      }
      if (operacao == "÷") {
        if (igualBool == false) {
          n2 = double.parse(valorFinal);
          valorFinal = (n1 / n2).toString();
        } else {
          n1 = n1 / n2;
          valorFinal = (double.parse(valorFinal) / n2).toString();
        }
        igualBool = true;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
          child: Center(
        child: ListTile(
          leading: Icon(
            Icons.favorite,
            size: 40,
            color: Colors.red,
          ),
          title: Text(
            "Sobre",
            style: TextStyle(
              fontSize: 35,
            ),
            textAlign: TextAlign.center,
          ),
          trailing: Icon(
            Icons.arrow_forward,
            size: 40,
          ),
          onTap: () {
            setState(() {
              Navigator.of(context).pushNamed("sobre");
            });
          },
        ),
      )),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Spacer(
              flex: 2,
            ),
            Text(
              "${(n1 != 0 || igualBool == true) ? n1 : ""} $operacao ${n2 != 0 ? n2 : ""}      ",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "$valorFinal   ",
              style: TextStyle(fontSize: 60, color: Colors.blue),
            ),
            Botoes(
              soma: soma,
              subtracao: subtracao,
              multiplicacao: multiplicacao,
              divisao: divisao,
              igual: igual,
              porcent: porcent,
              onTapNumber: (String valor) {
                if (valorFinal.contains(".") && valor.contains(".")) {
                  return;
                }
                if (valorFinal.length == 1 &&
                    valor != "." &&
                    valorFinal == "0") {
                  setState(() {
                    valorFinal = valor;
                  });
                } else {
                  setState(() {
                    valorFinal = valorFinal + valor;
                  });
                }
              },
              clear: () {
                setState(() {
                  valorFinal = '0';
                  n1 = 0;
                  n2 = 0;
                  operacao = '';
                  igualBool = false;
                });
              },
              reverso: () {
                setState(() {
                  if (valorFinal[0] != "-") {
                    valorFinal = "-" + valorFinal;
                  } else {
                    valorFinal = valorFinal.replaceFirst("-", "");
                  }
                });
              },
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}

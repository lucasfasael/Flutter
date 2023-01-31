import 'package:ex006/pages/models/tarefa_model.dart';
import 'package:flutter/material.dart';
import '../widgets/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool op = true;
  List<TarefaModel> tarefas = [];
  ScrollController scrollController = ScrollController();

  adicionaTarefas() {
    setState(() {
      TarefaModel tarefaModel = TarefaModel();
      tarefaModel.caminhoImagem = "assets/images/DashFlutter.png";
      tarefaModel.nivelDificuldade = 3;
      tarefaModel.nome = "Aprender Flutter";
      tarefas.add(tarefaModel);
    });
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 700),
      curve: Curves.easeInOutExpo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Tarefas',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Icon(Icons.add),
              onTap: adicionaTarefas,
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Colors.greenAccent,
      ),
      body: AnimatedOpacity(
        opacity: op ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          controller: scrollController,
          children: tarefas
              .map((e) => Task(e.nome, e.caminhoImagem, e.nivelDificuldade))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            op = !op;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Task('Aprender Flutter tomando café',
//     "assets/images/DashFlutter.png", 3),
// Task('Jogar', "assets/images/fliperama.jpg", 1),
// Task('Meditar', "assets/images/DashFlutter.png", 5),
// Task('Aprender Flutter', "assets/images/DashFlutter.png", 4),
// Task('Jogar', "assets/images/DashFlutter.png", 1),
// Task('Meditar', "assets/images/DashFlutter.png", 5)

abstract class ExecutaPagamento {
  bool pagar(double valorDoPagamento);
}

class ExecutaPagamentoPix extends ExecutaPagamento {
  @override
  bool pagar(double valorDoPagamento) {
    print("Regra de negocio pix");
    return true;
  }
}

class ExecutaPagamentoBoleto extends ExecutaPagamento {
  @override
  bool pagar(double valorDoPagamento) {
    print("Regra de negocio boleto");
    return true;
  }
}

class MyWidget extends StatefulWidget {
  final ExecutaPagamento executaPagamento;

  const MyWidget({super.key, required this.executaPagamento});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    widget.executaPagamento.pagar(50);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// class ClasseDePagameto {
//   bool pagar(double valorDoPagamento, String tipoPagamento) {
//     if (tipoPagamento == "pix") {
//       print("Regra de negocio pix");
//       return true;
//     }

//     if (tipoPagamento == "ted") {
//       print("Regra de negocio ted");
//       return true;
//     }

//     if (tipoPagamento == "boleto") {
//       print("Regra de negocio boleto");
//       return true;
//     }

//     return true;
//   }
// }

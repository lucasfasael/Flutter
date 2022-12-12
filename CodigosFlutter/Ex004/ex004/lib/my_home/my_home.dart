import 'package:ex004/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../delet_product/main.dart';
import '../show_product/show_product.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  final Repository res = Repository();
  String? valor;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {}, child: Text('Show all Products')),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await res.setOneProduct(valor);
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ShowProduct(model: res.getModel()!),
                          ));
                    },
                    child: Text('Show a Product')),
                Container(
                  width: 100,
                  child: TextField(
                    onChanged: (value) => valor = value,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 245, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: Text('Post New Product')),
            ElevatedButton(
                onPressed: () async {
                  await res.deletOneProduct(valor);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DeletProduct(model: res.getModel()!),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text("O produto $valor foi deletado com sucesso."),
                    ),
                  );
                  // await res.teste();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const DeletProduct(),
                  //     ));
                },
                child: Text('Delet Product'))
          ],
        ),
      ),
    );
  }
}

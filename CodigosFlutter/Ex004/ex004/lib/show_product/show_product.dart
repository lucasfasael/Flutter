import 'package:ex004/model/models.dart';
import 'package:flutter/material.dart';

class ShowProduct extends StatelessWidget {
  ShowProduct({super.key, required this.model});
  final Model model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(model.id.toString()),
            Text(model.brand??'sem info'),
            Text(model.category ?? 'sem info'),
            Text(model.description ?? 'sem info'),
            Text(model.discountPercentage.toString()),
            Text(model.price.toString()),
            Text(model.images?[0] ?? 'sem info'),
            Text(model.rating.toString()),
            Text(model.stock.toString()),
            Text(model.thumbnail?? 'sem info'),
            Text(model.title?? 'sem info')
          ],
        ),
      ),
    );
  }
}

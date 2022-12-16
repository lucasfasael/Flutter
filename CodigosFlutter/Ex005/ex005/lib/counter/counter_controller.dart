import 'package:ex005/counter/counter_model.dart';
import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  CounterModel contModel = CounterModel(cont: 0);
  void increment() {
    contModel.increment();
    notifyListeners();
  }
}

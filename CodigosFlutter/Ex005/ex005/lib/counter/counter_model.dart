import 'package:flutter/cupertino.dart';

class CounterModel {
  int cont;

  CounterModel({required this.cont});
  factory CounterModel.fromJson(Map<String, dynamic> json) {
    return CounterModel(cont: json['cont']);
  }
  void increment() {
    cont++;
  }

  Map<String, dynamic> toJson() {
    return {'cont': cont};
  }
}

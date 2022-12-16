import 'package:ex005/counter/counter_controller.dart';
import 'package:ex005/counter/counter_screen.dart';
import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late CounterController controller;
  @override
  void initState() {
    super.initState();
    controller = CounterController();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => CounterScreen(controller: controller,),
    );
  }
}

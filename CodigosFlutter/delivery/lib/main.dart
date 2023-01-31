import 'package:delivery_app/app/delivery_app.dart';
import 'package:flutter/material.dart';
import 'app/core/config/env/env.dart';

Future<void> main() async {
  await Env.i.load();
  runApp(const DeliveryApp());
}

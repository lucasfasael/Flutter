import 'package:delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

import '../../core/config/env/env.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.colors.primary;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: ColoredBox(
        color: Color(0XFF140E0E),
      ),
    );
  }
}

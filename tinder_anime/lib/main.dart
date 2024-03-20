import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinder_anime/screens/AddScreen.dart';
import 'package:tinder_anime/screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.redAccent,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.robotoSlabTextTheme(),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(
              popAnime: (anime) {
                animes.removeLast();
              },
            ),
        "/add_screen": (context) => AddScreen(
              addAnime: (anime) {
                // Passando addAnime como parâmetro
                animes.add(anime); // Adicionando anime à lista
              },
            ),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokemon_dt_app/pages/home_screen.dart';

void main() {
  runApp(const PokemonDT());
}

class PokemonDT extends StatelessWidget {
  const PokemonDT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

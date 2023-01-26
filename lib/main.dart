import 'package:flutter/material.dart';
import 'package:pokemon_dt_app/page/pokedex/pokedex-page.dart';

void main() {
  runApp(const PokemonDT());
}

class PokemonDT extends StatelessWidget {
  const PokemonDT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokedexPage(),
    );
  }
}

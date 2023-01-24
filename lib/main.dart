import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_dt_app/pages/home_screen.dart';

void main() {
  runApp(PokemonDT());
}

class PokemonDT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

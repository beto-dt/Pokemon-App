import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokemonApi = 'https://pokeapi.co/api/v2/pokemon';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          child: const Text('Press Button'),
          onPressed: () {
            fetchPokemonData();
          }),
    ));
  }

  void fetchPokemonData() {
    var url = Uri.parse('https://www.pokeapi.co/api/v2/pokemon');
    // ignore: avoid_print
    http.get(url).then((value) => {print(jsonDecode(value.body))});
  }
}

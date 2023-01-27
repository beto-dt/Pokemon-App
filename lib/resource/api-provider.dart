import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_dt_app/model/pokedex-detail-model.dart';
import 'package:pokemon_dt_app/model/pokedex-model.dart';

class ApiProvider {
  final Dio _dio = Dio();

  final String _url_base = 'https://pokeapi.co/api/v2';

  Future<PokedexModel?> fetchPokedexList() async {
    final String _url_pokedex = _url_base + '/pokemon';

    try {
      Response response = await _dio.get(_url_pokedex);
      return PokedexModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return null;
    }
  }

  Future<PokemonDetailModel?> getPokemon(int pokemonId) async {
    final String _url_pokemon = _url_base + '/pokemon/1';

    try {
      Response response = await _dio.get(_url_pokemon);
      return PokemonDetailModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return null;
    }
  }
}

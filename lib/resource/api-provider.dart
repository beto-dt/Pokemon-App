import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_dt_app/model/pokedex-info-model.dart';
import 'package:pokemon_dt_app/model/pokedex-model.dart';
import 'package:pokemon_dt_app/model/pokedex_info_response_model.dart';
import 'package:pokemon_dt_app/model/pokedex_species_info_model.dart';

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

  Future<PokedexInfoResponseModel?> getPokemonInfo(int pokemonId) async {
    final String _url_pokemon_info = _url_base + '/pokemon/${pokemonId}';
    try {
      Response response = await _dio.get(_url_pokemon_info);
      final json = jsonDecode(response.data);

      return PokedexInfoResponseModel.fromJson(json);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return null;
    }
  }

  Future<PokedexSpeciesInfoModel?> getPokemonSpeciesInfo(int pokemonId) async {
    final String _url_pokemon_species =
        _url_base + '/pokemon-species/${pokemonId}';
    try {
      Response response = await _dio.get(_url_pokemon_species);
      final json = jsonDecode(response.data);

      return PokedexSpeciesInfoModel.fromJson(json);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return null;
    }
  }
}

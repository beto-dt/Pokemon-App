import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:pokemon_dt_app/model/pokedex-model.dart';

class ApiProvider {
  final Dio _dio = Dio();

  final String _url_pokedex = 'https://pokeapi.co/api/v2/pokemon';

  Future<PokedexModel?> fetchPokedexList() async {
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
}

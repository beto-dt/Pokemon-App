import 'package:pokemon_dt_app/model/pokedex-detail-model.dart';
import 'package:pokemon_dt_app/model/pokedex-model.dart';
import 'api-provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<PokedexModel?> fetchPokedexList() {
    return _provider.fetchPokedexList();
  }

  Future<PokemonDetailModel?> getPokemon(int pokemonId) {
    return _provider.getPokemon(pokemonId);
  }
}

class NetworkError extends Error {}

import 'package:pokemon_dt_app/model/pokedex-model.dart';
import 'api-provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<PokedexModel?> fetchPokedexList() {
    return _provider.fetchPokedexList();
  }
}

class NetworkError extends Error {}

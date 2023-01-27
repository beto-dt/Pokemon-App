part of 'pokedex-detail-bloc.dart';

abstract class PokedexDetailEvent extends Equatable {
  final pokemonId;
  const PokedexDetailEvent(this.pokemonId);

  @override
  List<Object> get props => [];
}

class GetPokedexDetailList extends PokedexDetailEvent {
  GetPokedexDetailList(super.pokemonId);
}

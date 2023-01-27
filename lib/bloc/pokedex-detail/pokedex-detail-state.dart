part of 'pokedex-detail-bloc.dart';

abstract class PokedexDetailState extends Equatable {
  const PokedexDetailState();

  @override
  List<Object?> get props => [];
}

class PokedexDetailInitial extends PokedexDetailState {}

class PokedexDetailLoading extends PokedexDetailState {}

class PokedexDetailLoaded extends PokedexDetailState {
  final PokemonDetailModel pokemonDetailModel;
  const PokedexDetailLoaded(this.pokemonDetailModel);
}

class PokedexDetailError extends PokedexDetailState {
  final String? message;
  const PokedexDetailError(this.message);
}

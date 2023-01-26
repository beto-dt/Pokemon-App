part of 'pokedex-bloc.dart';

abstract class PokedexState extends Equatable {
  const PokedexState();

  @override
  List<Object?> get props => [];
}

class PokedexInitial extends PokedexState {}

class PokedexLoading extends PokedexState {}

class PokedexLoaded extends PokedexState {
  final PokedexModel pokedexModel;
  const PokedexLoaded(this.pokedexModel);
}

class PokedexError extends PokedexState {
  final String? message;
  const PokedexError(this.message);
}

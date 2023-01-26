part of 'pokedex-bloc.dart';

abstract class PokedexEvent extends Equatable {
  const PokedexEvent();

  @override
  List<Object> get props => [];
}

class GetPokedexList extends PokedexEvent {}

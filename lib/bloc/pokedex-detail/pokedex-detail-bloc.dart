import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_dt_app/model/pokedex-detail-model.dart';
import 'package:pokemon_dt_app/resource/api-repository.dart';
part 'pokedex-detail-event.dart';
part 'pokedex-detail-state.dart';

class PokedexDetailBloc extends Bloc<PokedexDetailEvent, PokedexDetailState> {
  PokedexDetailBloc() : super(PokedexDetailInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetPokedexDetailList>((event, emit) async {
      try {
        emit(PokedexDetailLoading());
        final mList = await _apiRepository.getPokemon(0);
        emit(PokedexDetailLoaded(mList!));
      } on NetworkError {
        emit(const PokedexDetailError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_dt_app/resource/api-repository.dart';
import 'package:pokemon_dt_app/model/pokedex-model.dart';
part 'pokedex-event.dart';
part 'pokedex-state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  PokedexBloc() : super(PokedexInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetPokedexList>((event, emit) async {
      try {
        emit(PokedexLoading());
        final mList = await _apiRepository.fetchPokedexList();
        emit(PokedexLoaded(mList!));
      } on NetworkError {
        emit(
            const PokedexError("Failed to fetch data. is your device online?"));
      }
    });
  }
}

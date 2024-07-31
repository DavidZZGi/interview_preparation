// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:interview_preparation/domain/usecases/get_pokemons.dart';
import 'package:meta/meta.dart';

import '../../../data/models/pokemon_model.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemons getPokemons;
  List<Pokemon> _allPokemons = [];
  PokemonBloc({required this.getPokemons}) : super(PokemonInitial()) {
    on<OnPokemonLoad>((event, emit) async {
      try {
        emit(PokemonLoading());
        final list = await getPokemons.call();
        _allPokemons = list;

        emit(PokemonSuccess(pokemons: list));
      } catch (e) {
        emit(PokemonError());
      }
    });
    on<OnPokemonSearch>((event, emit) {
      final query = event.query.toLowerCase();
      final filteredPokemons = _allPokemons
          .where((pokemon) => pokemon.name.toLowerCase().contains(query))
          .toList();
      emit(PokemonSuccess(pokemons: filteredPokemons));
    });
  }
}

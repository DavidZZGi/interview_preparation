import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_source/pokemon_datasource.dart';
import '../../data/models/pokemon_model.dart';
import '../../data/repository/pokemon_repository.dart';
import '../../domain/usecases/get_pokemons.dart';

final pokemonProvider = FutureProvider<List<Pokemon>>((ref) {
  final getPokemons = ref.watch(getPokemonsProvider);
  return getPokemons();
});

final getPokemonsProvider = Provider((ref) => GetPokemons(
      repository: ref.read(pokemonRepositoryProvider),
    ));

final pokemonRepositoryProvider = Provider((ref) => PokemonRepository(
        dataSource: PokemonService(
      dio: Dio(),
    )));

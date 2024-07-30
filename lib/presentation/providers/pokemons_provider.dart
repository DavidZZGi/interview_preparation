import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_source/pokemon_datasource.dart';
import '../../data/repository/pokemon_repository.dart';
import '../../domain/entities/pokemon_entities.dart';
import '../../domain/usecases/get_pokemons.dart';

final pokemonProvider = FutureProvider<List<PokemonEntity>>((ref) {
  final getProducts = ref.watch(getPokemonsProvider);
  return getProducts();
});

final getPokemonsProvider = Provider((ref) => GetPokemons(
      repository: ref.read(pokemonRepositoryProvider),
    ));

final pokemonRepositoryProvider = Provider((ref) => PokemonRepository(
      dataSource: ProductApiService(
          dio: Dio(BaseOptions(baseUrl: 'https://api.ejemplo.com/', headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }))),
    ));

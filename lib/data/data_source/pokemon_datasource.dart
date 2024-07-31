import 'package:dio/dio.dart';
import '../models/pokemon_model.dart';

class PokemonService {
  final Dio dio;

  PokemonService({required this.dio});

  Future<List<Pokemon>> getPokemons() async {
    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon?limit=50');
      final results = response.data['results'] as List;

      // Fetch details for each Pokémon
      final List<Pokemon> pokemons = [];
      for (var result in results) {
        final pokemonResponse = await dio.get(result['url']);
        final pokemon = Pokemon.fromJson(pokemonResponse.data);
        pokemons.add(pokemon);
      }

      return pokemons;
    } catch (e) {
      return [];
    }
  }
}

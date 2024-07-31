import '../../data/models/pokemon_model.dart';

abstract class PokemonInterface {
  Future<List<Pokemon>> getPokemons();
}

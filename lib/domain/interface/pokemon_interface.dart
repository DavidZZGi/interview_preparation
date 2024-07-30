import '../entities/pokemon_entities.dart';

abstract class PokemonInterface {
  Future<List<PokemonEntity>> getProducts();
}

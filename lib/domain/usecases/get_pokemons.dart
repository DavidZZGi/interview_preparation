import '../../data/repository/pokemon_repository.dart';
import '../entities/pokemon_entities.dart';

class GetPokemons {
  final PokemonRepository repository;

  GetPokemons({required this.repository});

  Future<List<PokemonEntity>> call() async {
    return await repository.getProducts();
  }
}

import '../../data/models/pokemon_model.dart';
import '../../data/repository/pokemon_repository.dart';

class GetPokemons {
  final PokemonRepository repository;

  GetPokemons({required this.repository});

  Future<List<Pokemon>> call() async {
    return await repository.getPokemons();
  }
}

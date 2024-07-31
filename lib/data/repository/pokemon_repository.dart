import 'package:interview_preparation/domain/interface/pokemon_interface.dart';

import '../data_source/pokemon_datasource.dart';
import '../models/pokemon_model.dart';

class PokemonRepository extends PokemonInterface {
  PokemonService dataSource;
  PokemonRepository({required this.dataSource});
  @override
  Future<List<Pokemon>> getPokemons() async {
    return await dataSource.getPokemons();
  }
}

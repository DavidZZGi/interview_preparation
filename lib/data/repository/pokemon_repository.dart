import 'package:interview_preparation/domain/entities/pokemon_entities.dart';
import 'package:interview_preparation/domain/interface/pokemon_interface.dart';

import '../data_source/pokemon_datasource.dart';

class PokemonRepository extends PokemonInterface {
  ProductApiService dataSource;
  PokemonRepository({required this.dataSource});
  @override
  Future<List<PokemonEntity>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}

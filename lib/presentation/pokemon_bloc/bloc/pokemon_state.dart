part of 'pokemon_bloc.dart';

final class PokemonState {}

final class PokemonInitial extends PokemonState {}

final class PokemonLoading extends PokemonState {}

final class PokemonSuccess extends PokemonState {
  List<Pokemon> pokemons;
  PokemonSuccess({required this.pokemons});
}

final class PokemonError extends PokemonState {}

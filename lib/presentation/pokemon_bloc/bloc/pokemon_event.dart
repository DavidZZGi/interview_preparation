part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonEvent {}

final class OnPokemonLoad extends PokemonEvent {}

class OnPokemonSearch extends PokemonEvent {
  final String query;

  OnPokemonSearch(this.query);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/theme_data.dart';
import '../../data/models/pokemon_model.dart';
import '../pokemon_bloc/bloc/pokemon_bloc.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  PokemonPageState createState() => PokemonPageState();
}

class PokemonPageState extends State<PokemonPage> {
  Pokemon? _selectedPokemon;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<PokemonBloc>().add(OnPokemonLoad());
    _searchController.addListener(() {
      context.read<PokemonBloc>().add(OnPokemonSearch(_searchController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon List'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search Pokémon',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonInitial) {
            return Center(child: Text('Welcome! Fetching Pokémon...'));
          } else if (state is PokemonLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PokemonSuccess) {
            return Row(
              children: [
                // List of Pokémon
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: state.pokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = state.pokemons[index];
                      return ListTile(
                        tileColor: _selectedPokemon == pokemon
                            ? selectedTileColor
                            : listTileColor,
                        leading: Image.network(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.id}.png',
                          width: 50,
                          height: 50,
                        ),
                        title: Text(
                          pokemon.name,
                          style: TextStyle(color: Colors.black87),
                        ),
                        subtitle: Text(
                          'Height: ${pokemon.height}m, Weight: ${pokemon.weight}kg',
                          style: TextStyle(color: Colors.black54),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedPokemon = pokemon;
                          });
                        },
                      );
                    },
                  ),
                ),
                // Pokémon details
                Expanded(
                  flex: 1,
                  child: _selectedPokemon == null
                      ? Center(child: Text('Select a Pokémon to see details'))
                      : Container(
                          color: detailBackgroundColor,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.network(
                                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${_selectedPokemon!.id}.png',
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Name: ${_selectedPokemon!.name}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                'Base Experience: ${_selectedPokemon!.baseExperience}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                'Height: ${_selectedPokemon!.height} meters',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                'Weight: ${_selectedPokemon!.weight} kg',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Abilities:',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              ..._selectedPokemon!.abilities
                                  .map((ability) => Text(ability)),
                            ],
                          ),
                        ),
                ),
              ],
            );
          } else if (state is PokemonError) {
            return const Center(child: Text('Failed to fetch Pokémon.'));
          }
          return Container();
        },
      ),
    );
  }
}

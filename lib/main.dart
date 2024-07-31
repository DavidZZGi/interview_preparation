import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_preparation/data/repository/pokemon_repository.dart';
import 'package:interview_preparation/domain/usecases/get_pokemons.dart';
import 'package:interview_preparation/presentation/pokemon_bloc/bloc/pokemon_bloc.dart';
import 'package:interview_preparation/routes/route_config.dart';

import 'data/data_source/pokemon_datasource.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonBloc(
          getPokemons: GetPokemons(
              repository:
                  PokemonRepository(dataSource: PokemonService(dio: Dio())))),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}

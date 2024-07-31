import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_preparation/data/models/pokemon_model.dart';

class ProductCard extends ConsumerWidget {
  final Pokemon pokemon;

  const ProductCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        print('kki');
      },
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(pokemon.baseExperience.toString()),
                  const SizedBox(height: 10),
                  Text(pokemon.weight.toString(),
                      style: const TextStyle(color: Colors.green)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        //    ref.read(riverpoodHardLevel).increasePrice(product);
                      },
                      child: const Text('Increase')),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        //           ref.read(riverpoodHardLevel).decreasePrice(product);
                      },
                      child: const Text('Decrease')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/pokemon_model.dart';
import 'controller_models/riverpod_model.dart';

final riverpoodEasyLevel = StateProvider<int>((ref) {
  return 0;
});

final riverpoodHardLevel = ChangeNotifierProvider<RiverpodModel>((ref) {
  return RiverpodModel(product: [
    Pokemon(
      id: 1,
      name: 'Charizard',
      baseExperience: 240,
      height: 1.7,
      weight: 90.5,
      abilities: ['Blaze', 'Solar Power'],
    ),
    Pokemon(
      id: 2,
      name: 'Bulbasaur',
      baseExperience: 64,
      height: 0.7,
      weight: 6.9,
      abilities: ['Overgrow', 'Chlorophyll'],
    ),
  ]);
});

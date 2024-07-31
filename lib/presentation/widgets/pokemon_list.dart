import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_preparation/presentation/widgets/pokemon_card.dart';

import '../../state_management/riverpood.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: ref.read(riverpoodHardLevel).product.length,
      itemBuilder: (context, index) {
        return ProductCard(
            pokemon: ref.read(riverpoodHardLevel).product[index]);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:interview_preparation/data/models/pokemon_model.dart';

class RiverpodModel extends ChangeNotifier {
  List<Pokemon> product;
  RiverpodModel({required this.product});
  void increasePrice(Pokemon product) {
    //  product.price += 10;
    notifyListeners();
  }

  void decreasePrice(Pokemon product) {
    //   product.price -= 10;
    notifyListeners();
  }
}

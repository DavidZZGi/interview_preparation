import 'package:dio/dio.dart';
import '../models/pokemon_model.dart';

class ProductApiService {
  final Dio dio;

  ProductApiService({required this.dio});

  Future<List<Pokemon>> fetchProducts() async {
    try {
      final response = await dio.get('/products');
      List<dynamic> data = response.data;
      return data.map((productJson) => Pokemon.fromJson(productJson)).toList();
    } on DioException catch (e) {
      print('Error fetching products: ${e.message}');
      rethrow;
    }
  }

  Future<Pokemon> fetchProductById(int id) async {
    try {
      final response = await dio.get('/products/$id');
      return Pokemon.fromJson(response.data);
    } on DioException catch (e) {
      print('Error fetching product: ${e.message}');
      rethrow;
    }
  }

  Future<void> createProduct(Pokemon pokemon) async {
    try {
      await dio.post('/products', data: pokemon.toJson());
    } on DioException catch (e) {
      print('Error creating product: ${e.message}');
      rethrow;
    }
  }
}

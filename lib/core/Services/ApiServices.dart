import 'package:dio/dio.dart';
import '../../Models/Product Models.dart';


class ApiService {
  final Dio dio = Dio();
  final String baseUrl = 'https://fakestoreapi.in/api';

  // Get products
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await dio.get('$baseUrl/products');

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        List<dynamic> products = data['products'];
        print("------------------------Successfull");
        return products.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('-------------------------Failed to load products: $e');
    }
  }

  // Post products
  Future<bool> addProduct(Product product) async {
    try {
      FormData formData = FormData.fromMap({
        'title': product.title,
        'image': product.image,
        'price': product.price,
        'description': product.description,
        'brand': product.brand,
        'model': product.model,
        'color': product.color,
        'category': product.category,
        'discount': product.discount,
      });
      final response = await dio.post(
        '$baseUrl/products',
        data: formData,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print("**********************************************");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("wrong");
      throw Exception('Failed to add product: $e');
    }
  }

  //update product
  Future<bool> UpdateProduct(Product product) async {
    try {
      FormData formData = FormData.fromMap({
        'title': product.title,
        'image': product.image,
        'price': product.price,
        'description': product.description,
        'brand': product.brand,
        'model': product.model,
        'color': product.color,
        'category': product.category,
        'discount': product.discount,
      });
      final response = await dio.put(
        '$baseUrl/products/${product.id}',
        data: formData,
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        print("**********************************************");
        print(" product updated successful");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("wrong");
      throw Exception('Failed to update product: $e');
    }
  }

  //delete product
  Future<bool> deleteProduct(int productId) async {
    try {
      final response = await dio.delete('$baseUrl/products/$productId');

      if (response.statusCode == 200 || response.statusCode == 204) {
        print("Product deleted successfully");
        return true;
      } else {
        throw Exception('Failed to delete product');
      }
    } catch (e) {
      print("Error: Failed to delete product: $e");
      throw Exception('Failed to delete product: $e');
    }
  }

}
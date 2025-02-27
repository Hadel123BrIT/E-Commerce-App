import 'package:get/get.dart';
import '../Models/Product Models.dart';
import '../Services/ApiServices.dart';

class ProductController extends GetxController {
  final ApiService apiService = ApiService();
  var products = <Product>[].obs;

  Future<void> fetchProducts() async {
    try {
      List<Product> fetchedProducts = await apiService.fetchProducts();
      products.assignAll(fetchedProducts);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load products: $e');
    }
  }


  void addProductToList(Product product) {
    products.add(product);
  }
}
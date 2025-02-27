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
      Get.snackbar('Error', 'Failed to load products: $e',
      snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //to add the orgin list in product screen
  void addProductToList(Product product) {
    products.add(product);

  }

 // to update product in product screen
  void updateProductInList(Product updatedProduct) {
    //query
    final index = products.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      products[index] = updatedProduct;
    }
  }
}
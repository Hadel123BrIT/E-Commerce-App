import 'package:get/get.dart';
import '../../../Models/Product Models.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  var quantities = <int, int>{}.obs;

  void addToCart(Product product, int quantity) {
    if (quantities.containsKey(product.id)) {
      quantities[product.id!] = quantities[product.id]! + quantity;
    } else {
      quantities[product.id!] = quantity;
      cartItems.add(product);
    }
    update();
  }

  double get totalAmount {
    return cartItems.fold(0.0, (sum, product) {
      final quantity = quantities[product.id] ?? 0;
      return sum + (product.price! * quantity);
    });
  }
}
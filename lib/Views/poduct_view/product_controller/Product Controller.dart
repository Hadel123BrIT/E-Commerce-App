import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../Models/Product Models.dart';
import '../../../core/Services/ApiServices.dart';

class ProductController extends GetxController {
  final ApiService apiService = ApiService();
  var products = <Product>[].obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void onClose() {
    titleController.dispose();
    imageController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    brandController.dispose();
    modelController.dispose();
    colorController.dispose();
    categoryController.dispose();
    discountController.dispose();
    super.onClose();
  }

  void clearFields() {
    titleController.clear();
    imageController.clear();
    priceController.clear();
    descriptionController.clear();
    brandController.clear();
    modelController.clear();
    colorController.clear();
    categoryController.clear();
    discountController.clear();
  }

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

  Future<void> addProduct() async {
    try {
      Product newProduct = Product(
        id: 0,
        title: titleController.text,
        image: imageController.text,
        price: int.parse(priceController.text),
        description: descriptionController.text,
        brand: brandController.text,
        model: modelController.text,
        color: colorController.text,
        category: categoryController.text,
        discount: int.parse(discountController.text),
      );

      bool success = await apiService.addProduct(newProduct);
      if (success) {
        addProductToList(newProduct);
        await fetchProducts();
        clearFields();
        Get.back();
        Get.snackbar('Success', 'Product added successfully!');
      } else {
        Get.snackbar('Error', 'Failed to add product.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      print(e);
    }
  }

  Future<void> UpdatedProduct(Product product) async {
    try {
      Product updatedProduct = Product(
        id: product.id,
        title: titleController.text,
        image: imageController.text,
        price: int.parse(priceController.text),
        description: descriptionController.text,
        brand: brandController.text,
        model: modelController.text,
        color: colorController.text,
        category: categoryController.text,
        discount: int.parse(discountController.text),
      );
      bool success = await apiService.UpdateProduct(updatedProduct);
      if (success) {
        updateProductInList(updatedProduct);
        await fetchProducts();
        print("Now its loading");
        print("Now its done");
        Get.back();
        Get.snackbar('Success', 'Product updated successfully!------------------------');
      } else {
        Get.snackbar('Error', 'Failed to update product.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      print(e);
    }
  }

  Future<void> deleteProduct(int productId) async {
    try {
      bool success = await apiService.deleteProduct(productId);

      if (success) {
        removeProductFromList(productId);
        Get.snackbar('Success', 'Product deleted successfully!',);
      } else {
        Get.snackbar('Error', 'Failed to delete product',);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e',);
      print(e);
    }
  }

  void loadProductData(Product product) {
    titleController.text = product.title!;
    imageController.text = product.image!;
    priceController.text = product.price.toString();
    descriptionController.text = product.description!;
    brandController.text = product.brand!;
    modelController.text = product.model!;
    colorController.text = product.color!;
    categoryController.text = product.category!;
    discountController.text = product.discount.toString();
  }

  void removeProductFromList(int productId) {
    products.removeWhere((product) => product.id == productId);
    print("Product removed from list: $productId");
  }

  void addProductToList(Product product) {
    products.add(product);
    update();
  }

  void updateProductInList(Product updatedProduct) {
    final index = products.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      products[index] = updatedProduct;
      update();
      print("Product updated in list: ${updatedProduct.title}");
    } else {
      print("Product not found in list: ${updatedProduct.id}");
    }

  }
}
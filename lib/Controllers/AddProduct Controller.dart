import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Models/Product Models.dart';
import '../Services/ApiServices.dart';
import 'Product Controller.dart';

class AddProductController extends GetxController {
  final ApiService apiService = ApiService();
  final ProductController productController = Get.put(ProductController());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

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
        productController.addProductToList(newProduct);
        Get.back();
        Get.snackbar('Success', 'Product added successfully!');
      } else {
        Get.snackbar('Error', 'Failed to add product.');
      }
    }
    catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      print(e);
    }
  }

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
}
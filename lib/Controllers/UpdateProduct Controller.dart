import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Models/Product Models.dart';
import '../Services/ApiServices.dart';
import 'Product Controller.dart';

class UpdateProductController extends GetxController {
  final ApiService apiService = ApiService();
  final ProductController productController = Get.put(ProductController());
  late Product product;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  void loadProductData(Product product) {
    this.product = product;
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

  Future<void> UpdateProduct(Product product) async {
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
        productController.updateProductInList(updatedProduct);
        Get.back();
        Get.snackbar('Success', 'Product updated successfully!',

        );
      } else {
        Get.snackbar('Error', 'Failed to update product.',

        );
      }
    }
    catch (e) {
      Get.snackbar('Error', 'An error occurred: $e',

      );
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Const/color.dart';
import '../Controllers/UpdateProduct Controller.dart';
import '../Models/Product Models.dart';
import '../component/ProductUtils.dart';

class UpdateProductScreen extends StatelessWidget {
  final UpdateProductController controller = Get.put(UpdateProductController());
  final Product product = Get.arguments;

  UpdateProductScreen({super.key, required product});

  @override
  Widget build(BuildContext context) {
    controller.loadProductData(product);
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductUtils.buildProductImage(controller.imageController.text, product.id ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Text(
                'Update Product Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ProductUtils.buildInputField(context, 'Title', controller.titleController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ProductUtils.buildInputField(context, 'Image URL', controller.imageController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ProductUtils.buildInputField(context, 'Price', controller.priceController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ProductUtils.buildInputField(context, 'Description', controller.descriptionController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ProductUtils.buildInputField(context, 'Brand', controller.brandController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ProductUtils.buildInputField(context, 'Model', controller.modelController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ProductUtils.buildInputField(context, 'Color', controller.colorController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ProductUtils.buildInputField(context, 'Category', controller.categoryController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ProductUtils.buildInputField(context, 'Discount', controller.discountController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ElevatedButton(
                onPressed: () async {
                  await controller.UpdateProduct(product);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 8),
                    Text(
                      'Update Product',
                      style: TextStyle(color: black, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
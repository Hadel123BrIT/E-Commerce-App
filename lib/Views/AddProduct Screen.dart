import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/AddProduct Controller.dart';
import '../component/ProductUtils.dart';
class AddProductScreen extends StatelessWidget {
  final AddProductController controller = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Text(
                'Add New Product',
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
                  await controller.addProduct();
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
                    SizedBox(width: 8),
                    Text(
                      'Add Product',
                      style: TextStyle(color: Colors.black, fontSize: 16),
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
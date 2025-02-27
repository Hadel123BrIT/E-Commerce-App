import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/AddProduct Controller.dart';

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
            children: [
              TextField(
                controller: controller.titleController,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                controller: controller.imageController,
                decoration: InputDecoration(hintText: 'Image URL'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                controller: controller.priceController,
                decoration: InputDecoration(hintText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                controller: controller.descriptionController,
                decoration: InputDecoration(hintText: 'Description'),
                maxLines: 3,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                controller: controller.brandController,
                decoration: InputDecoration(hintText: 'Brand'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                controller: controller.modelController,
                decoration: InputDecoration(hintText: 'Model'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                controller: controller.colorController,
                decoration: InputDecoration(hintText: 'Color'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                controller: controller.categoryController,
                decoration: InputDecoration(hintText: 'Category'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                controller: controller.discountController,
                decoration: InputDecoration(hintText: 'Discount'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ElevatedButton(
                onPressed: () async {
                  await controller.addProduct();
                },
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
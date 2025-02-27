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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: controller.titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: controller.imageController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              TextField(
                controller: controller.priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: controller.descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              TextField(
                controller: controller.brandController,
                decoration: InputDecoration(labelText: 'Brand'),
              ),
              TextField(
                controller: controller.modelController,
                decoration: InputDecoration(labelText: 'Model'),
              ),
              TextField(
                controller: controller.colorController,
                decoration: InputDecoration(labelText: 'Color'),
              ),
              TextField(
                controller: controller.categoryController,
                decoration: InputDecoration(labelText: 'Category'),
              ),
              TextField(
                controller: controller.discountController,
                decoration: InputDecoration(labelText: 'Discount'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Models/Product Models.dart';
import '../card_controller/cart controller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (cartController.cartItems.isEmpty) {
                  return Center(
                    child: Text('Your cart is empty', style: TextStyle(fontSize: 18)),
                  );
                } else {
                  return ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartController.cartItems[index];
                      final quantity = cartController.quantities[product.id] ?? 0;
                      final totalPrice = product.price! * quantity;
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: ListTile(
                         // leading: Image.network(product.image ?? '', width: 50, height: 50, fit: BoxFit.cover),
                          title: Text(product.title ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text('Quantity: $quantity',
                            style: TextStyle(
                                color: Colors.grey
                            ),
                          ),
                          trailing: Text('\$${totalPrice.toStringAsFixed(2)}'),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
            Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() {
                final totalAmount = cartController.totalAmount;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: 16),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 50, 54, 56),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      "checkout",
                      style: TextStyle(
                        fontSize: 17.5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
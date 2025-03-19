import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Models/Product Models.dart';
import '../../../core/constances/all_colors.dart';
import '../../Card_view/card_controller/cart controller.dart';

class DetialsScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController(),permanent: true);
  final quantity = 1.obs;

  DetialsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 6,
                        spreadRadius: 6,
                        offset: Offset(0, 3),
                        color: black.withOpacity(0.03)
                    )
                  ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  child: Hero(
                      tag: product?.id ?? '',
                      child: Image.network(product!.image ?? '')
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(
              product.title ?? '',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              "Category : ${product.category ?? ''}",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              "Brand : ${product.brand ?? ''}",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              "Model : ${product.model ?? ''}",
              style: TextStyle(
                fontSize: 18,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              "Color : ${product.color ?? ''}",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              "Price: \$${product.price ?? 0}",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              "Discount: ${product.discount ?? 0}%",
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            if (product.popular ?? false)
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  Text('Popular', style: TextStyle(color: Colors.amber, fontSize: 18)),
                ],
              ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(
              "Description:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              " ${product.description ?? ''}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    cartController.addToCart(product, quantity.value);
                    Get.snackbar(
                      'Added to Cart',
                      '${product.title} has been added to your cart',
                      duration: Duration(seconds: 2),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 50, 54, 56),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      "Add to Card",
                      style: TextStyle(
                        fontSize: 17.5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: 120,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 50, 54, 56),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (quantity.value > 1) {
                            quantity.value--;
                          }
                        },
                        child: Icon(Icons.remove, color: Colors.white, size: 18),
                      ),
                      Obx(() => Text("${quantity.value}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )),
                      InkWell(
                        onTap: () {
                          quantity.value++;
                        },
                        child: Icon(Icons.add, color: Colors.white, size: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
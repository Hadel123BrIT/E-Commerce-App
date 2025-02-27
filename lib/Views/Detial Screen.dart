import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Const/color.dart';
import '../Controllers/Detial Controller.dart';
import '../Controllers/Favourite Controller.dart';
import '../Models/Product Models.dart';

class DetialsScreen extends StatelessWidget {
  final DetialController controller = Get.put(DetialController());
  final FavouriteController favoriteController = Get.put(FavouriteController());

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
                    "Add to Card",
                    style: TextStyle(
                      fontSize: 17.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Obx(
                      () => IconButton(
                    icon: favoriteController.favorites.contains(product)
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border, color: black),
                    onPressed: () {
                      favoriteController.addProductToFavorutes(product);
                    },
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

import 'package:ecommerce_app/Routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Models/Product Models.dart';
import '../../../core/constances/all_colors.dart';
import '../../favourite_view/favourite_controller/Favourite Controller.dart';
import '../product_controller/Product Controller.dart';
import 'confirm Dialog.dart'; // استيراد ConfirmationDialog إذا تم إنشاءه

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavouriteController favoriteController = Get.put(FavouriteController());
    final ProductController productController = Get.find<ProductController>();

    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.detial, arguments: product);
      },
      onLongPress: () {
        ConfirmationDialog.show(
          title: "Edit Product",
          message: "Do you want to edit this product?",
          onConfirm: () {
            Get.back();
            Get.toNamed(AppRoutes.updateProduct, arguments: product);
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                spreadRadius: 6,
                offset: Offset(0, 3),
                color: black.withOpacity(0.05),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "category : ${product.category ?? ''}",
                              style: TextStyle(
                                color: black.withOpacity(0.35),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${product.price ?? 0}\$",
                              style: TextStyle(fontSize: 16, color: Colors.green),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${product.discount ?? 0}%",
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                            if (product.popular ?? false) SizedBox(height: 10),
                            if (product.popular ?? false)
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber),
                                  SizedBox(width: 5),
                                  Text('Popular', style: TextStyle(color: Colors.amber)),
                                ],
                              ),
                            SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.detial, arguments: product);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "details  ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 6,
                                offset: Offset(0, 3),
                                color: black.withOpacity(0.03),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              child: Hero(
                                  tag: product.id ?? '',
                                  child: Image.network(product.image ?? '')),
                            ),
                          ),
                        ),
                      ),
                    ],
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
              Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    ConfirmationDialog.show(
                      title: "Delete Product",
                      message: "Are you sure you want to delete this product?",
                      onConfirm: () async {
                        Get.back();
                        await productController.deleteProduct(product.id!);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

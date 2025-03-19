import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../poduct_view/widgets/Product item.dart';
import '../favourite_controller/Favourite Controller.dart';

class FavouriteScreen extends StatelessWidget {
  final FavouriteController favoriteController = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (favoriteController.favorites.isEmpty) {
          return Center(child: Text("No favorites yet"));
        } else {
          return ListView.builder(
            itemCount: favoriteController.favorites.length,
            itemBuilder: (context, index) {
              final product = favoriteController.favorites[index];
              return ProductItem(product: product);
            },
          );
        }
      }),
    );
  }
}
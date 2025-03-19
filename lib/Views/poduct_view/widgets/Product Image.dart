import 'package:flutter/cupertino.dart';

class ProductImage {
  static Widget buildProductImage(String imageUrl, int? heroTag) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(250),
      child: Container(
        child: Hero(
          tag: heroTag ?? 'product_image',
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}
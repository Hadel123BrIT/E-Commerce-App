import 'package:flutter/material.dart';

class ProductUtils {

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

  static InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  static Widget buildInputField(BuildContext context, String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        TextField(
          controller: controller,
          decoration: ProductUtils.customInputDecoration('Please Enter $label'),
        ),
      ],
    );
  }
}
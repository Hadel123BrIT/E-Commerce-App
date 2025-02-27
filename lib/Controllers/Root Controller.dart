import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  var tabIndex = 0.obs;
  List<IconData> tabs = []; // تغيير النوع إلى List<IconData>

  void onRender() {
    tabs = [
      Icons.home, // أيقونة المنزل
      Icons.favorite, // أيقونة المفضلة
    ];
  }

  @override
  void onInit() {
    onRender();
    super.onInit();
  }
}
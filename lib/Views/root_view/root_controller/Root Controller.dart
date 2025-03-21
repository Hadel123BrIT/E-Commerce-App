import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  var tabIndex = 0.obs;
  List<IconData> tabs = [];

  void onRender() {
    tabs = [
      Icons.home,
      Icons.favorite,
    ];
  }

  @override
  void onInit() {
    onRender();
    super.onInit();
  }
}
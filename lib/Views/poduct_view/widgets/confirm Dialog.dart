import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationDialog {
  static void show({
    required String title,
    required String message,
    required VoidCallback onConfirm,
  }) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      onConfirm: onConfirm,
    );
  }
}

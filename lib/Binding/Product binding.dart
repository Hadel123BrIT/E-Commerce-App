import 'package:ecommerce_app/Controllers/Product%20Controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(()=>ProductController());
  }

}
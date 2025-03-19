import 'package:ecommerce_app/Views/favourite_view/favourite_controller/Favourite%20Controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../Views/Detial_view/Detial_controller/Detial Controller.dart';
import '../Views/poduct_view/product_controller/Product Controller.dart';
import '../Views/root_view/root_controller/Root Controller.dart';

class InitalizeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>RootController());
    Get.lazyPut(()=>ProductController());
    Get.lazyPut(()=>FavouriteController());
    Get.lazyPut(()=>DetialController());
  }

}
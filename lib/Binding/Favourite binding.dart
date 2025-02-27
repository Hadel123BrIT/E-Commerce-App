import 'package:get/get.dart';

class FavouriteBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>FavouriteBinding());
  }

}
import 'package:get/get.dart';

import '../Controllers/UpdateProduct Controller.dart';

class UpdateProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>UpdateProductController());
  }

}
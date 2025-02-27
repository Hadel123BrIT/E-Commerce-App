import 'package:get/get.dart';

import '../Controllers/Detial Controller.dart';

class DetialBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>DetialController());
  }

}
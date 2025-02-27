import 'package:ecommerce_app/Controllers/Root%20Controller.dart';
import 'package:get/get.dart';

class RootBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(()=>RootController());
  }

}
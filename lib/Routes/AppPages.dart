import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Views/poduct_view/product_screen/AddProduct Screen.dart';
import '../Views/Detial_view/Detial_screen/Detial Screen.dart';
import '../Views/favourite_view/favourite_screen/Favourite Screen.dart';
import '../Views/poduct_view/product_screen/Products Screen.dart';
import '../Views/root_view/root_screen/Root Screen.dart';
import '../Views/splash_view/splash_screen/Splash Screen.dart';
import '../Views/poduct_view/product_screen/UpdateProduct Screen.dart';
import 'AppRoutes.dart';

class AppPages{
  static final pages=[
    GetPage(
        name: AppRoutes.splash,
        page: ()=> SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.products,
      page: ()=> ProductScreen(),
    ),
    GetPage(
      name: AppRoutes.favourite,
      page: ()=> FavouriteScreen(),
    ),
    GetPage(
      name: AppRoutes.root,
      page: ()=> RootScreen(),
    ),
    GetPage(
      name: AppRoutes.detial,
      page: ()=>  DetialsScreen(),
    ),
    GetPage(
      name: AppRoutes.AddProduct,
      page: ()=>  AddProductScreen(),

    ),
    GetPage(name: AppRoutes.updateProduct,
        page: () => UpdateProductScreen(product: Get.arguments),

    ),
  ];
}
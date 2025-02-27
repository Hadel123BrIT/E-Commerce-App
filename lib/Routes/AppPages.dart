import 'package:ecommerce_app/Binding/AddProduct%20binding.dart';
import 'package:ecommerce_app/Binding/favourite%20binding.dart';
import 'package:ecommerce_app/Routes/AppRoutes.dart';
import 'package:ecommerce_app/Views/Favourite%20Screen.dart';
import 'package:get/get.dart';
import '../Binding/Product binding.dart';
import '../Binding/Root binding.dart';
import '../Binding/Detial binding.dart';
import '../Views/AddProduct Screen.dart';
import '../Views/Products Screen.dart';
import '../Views/Root Screen.dart';
import '../Views/Splash Screen.dart';
import '../Views/Detial Screen.dart';

class AppPages{
  static final pages=[
    GetPage(
        name: AppRoutes.splash,
        page: ()=> SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.products,
      page: ()=> ProductScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.favourite,
      page: ()=> FavouriteScreen(),
      binding: FavouriteBinding(),
    ),
    GetPage(
      name: AppRoutes.root,
      page: ()=> RootScreen(),
      binding: RootBinding(),
    ),
    GetPage(
      name: AppRoutes.detial,
      page: ()=>  DetialsScreen(),
      binding: DetialBinding(),
    ),
    GetPage(
      name: AppRoutes.AddProduct,
      page: ()=>  AddProductScreen(),
      binding: AddProductBinding(),
    ),
  ];
}
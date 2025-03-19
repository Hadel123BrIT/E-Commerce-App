import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/Product Models.dart';

class FavouriteController extends GetxController{
  var favorites=<Product>[].obs;
  @override
  void onInit() {
    super.onInit();
    LoadFavorites();
  }
  Future<void> LoadFavorites() async{
    final pref=await SharedPreferences.getInstance();
    final favouriteJson=pref.getStringList('favorites')??[];
    favorites.assignAll(favouriteJson.map((json) => Product.fromJson(json as Map<String, dynamic>)).toList());
  }
  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = favorites.map((product) => product.toJson()).toList();
    prefs.setStringList('favorites', favoritesJson.cast<String>());
  }
  void addProductToFavorutes(Product product){
    if(favorites.contains(product)){
      favorites.remove(product);
    }
    else{
      favorites.add(product);
    }
    saveFavorites();
  }
}

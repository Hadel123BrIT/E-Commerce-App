import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce_app/Routes/AppRoutes.dart';
import 'package:ecommerce_app/Views/favourite_view/favourite_screen/Favourite%20Screen.dart';
import 'package:ecommerce_app/Views/poduct_view/product_screen/Products%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constances/all_colors.dart';
import '../../../widgets/BottomBar.dart';
import '../root_controller/Root Controller.dart';

class RootScreen extends GetView<RootController> {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RootController());
    final mediaQuery = MediaQuery.of(context);
    return Obx(
          () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildBody(),
        bottomNavigationBar: _buildFooter(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[300],
          child: Container(
            width: mediaQuery.size.width * 0.06,
            height: mediaQuery.size.width * 0.06,
            child: Icon(Icons.add_box_outlined, color: Colors.black),
          ),
          onPressed: () {
            Get.toNamed(AppRoutes.AddProduct);
            print("yes");
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: controller.tabIndex.value,
      children: [
        ProductScreen(),
        FavouriteScreen(),
      ],
    );
  }

  Widget _buildFooter() {
    return AnimatedBottomNavigationBar.builder(
      onTap: (index) {
        controller.tabIndex.value = index;
      },
      itemCount: controller.tabs.length,
      backgroundColor: black,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      tabBuilder: (int index, bool isActive) {
        return BottombarItem(
          isActive: isActive,
          icon: Icon(
            controller.tabs[index],
            color: isActive ? Colors.grey: Colors.grey,
          ),
        );
      },
      activeIndex: controller.tabIndex.value,
    );
  }
}

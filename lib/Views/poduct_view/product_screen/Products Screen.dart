import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constances/all_colors.dart';
import '../../Card_view/card_screen/card screen.dart';
import '../widgets/Product item.dart';
import '../product_controller/Product Controller.dart';
import '../../../Models/Product Models.dart';
import '../../../core/Services/ApiServices.dart';

class ProductScreen extends StatelessWidget {
  final ApiService apiService = ApiService();
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: FutureBuilder<List<Product>>(
        future: apiService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset(
                'assets/animations/Animation - 1740348375718.json',
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.25,
                fit: BoxFit.cover,
                repeat: true,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products found'));
          } else {
            productController.products.assignAll(snapshot.data!);
              return buildBody(context, productController.products);

          }
        },
      ),
    );
  }

  Widget buildBody(BuildContext context, List<Product> products) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getHeader(),
          SizedBox(height: mediaQuery.size.height * 0.02),
          getSearch(context),
      Obx(() {
        return  ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductItem(product: products[index]);
          },
        );
      }),

        ],
      ),
    );
  }

  Widget getHeader() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hey, Hadel,",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Welcome to shopping online",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            InkWell(
              onTap: (){

                Get.to(() => CartScreen());

              },
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 25,
                child: SvgPicture.asset("assets/icons/cart (1).svg",width: 25,height: 25,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSearch(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.search, color: grey),
                    labelText: "Search",
                    labelStyle:TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/filter.svg",
                color: grey,
                width: MediaQuery.of(context).size.width * 0.03,
                height: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

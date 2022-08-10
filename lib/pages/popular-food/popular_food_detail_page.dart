import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/models/popular/product_popular.dart';
import 'package:food_delivery/pages/popular-food/components/body_detail_page.dart';
import 'package:food_delivery/pages/popular-food/components/navigation/bottom_navigation.dart';
import 'package:food_delivery/pages/popular-food/components/header.dart';
import 'package:food_delivery/pages/popular-food/components/hero_image.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

class PopularFoodDetailPage extends StatelessWidget {
  const PopularFoodDetailPage({
    Key? key,
    required this.pageId,
  }) : super(key: key);
  final String pageId;

  @override
  Widget build(BuildContext context) {
    var productList = Get.find<PopularProductController>()
        .popularProductList
        .where((element) => element.id.toString() == pageId);
    ProductPopular product;

    if (productList.isNotEmpty) {
      product = productList.first;
    } else {
      Get.toNamed(RouteHelper.getInitial());
      return const Scaffold();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: HeroImage(image: product.img!),
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Header(),
          ),
          Positioned(
            top: Dimensions.heightDetailFoodImage - 20,
            bottom: 0,
            left: 0,
            right: 0,
            child: BodyDetailPage(productPopular: product),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(price: product.price!),
    );
  }
}

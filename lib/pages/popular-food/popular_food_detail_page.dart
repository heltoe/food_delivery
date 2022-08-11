import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/models/popular/product_popular.dart';
import 'package:food_delivery/pages/popular-food/components/body_detail_page.dart';
import 'package:food_delivery/pages/popular-food/components/navigation/bottom_navigation.dart';
import 'package:food_delivery/pages/popular-food/components/header.dart';
import 'package:food_delivery/pages/popular-food/components/hero_image.dart';
import 'package:food_delivery/helper/counter_operation.dart';
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
    // init instance controller
    PopularProductController popularProductController =
        Get.find<PopularProductController>();
    CartController cartController = Get.find<CartController>();
    //
    ProductPopular product;
    Iterable<ProductPopular> productList = popularProductController
        .popularProductList
        .where((element) => element.id.toString() == pageId);

    if (productList.isNotEmpty) {
      product = productList.first;
      popularProductController.initProduct(product, cartController);
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
            child: GetBuilder<PopularProductController>(builder: (controller) {
              return Header(countInCart: controller.inCartItems);
            }),
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
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          void changeCountMethod(CounterOperation type) {
            controller.setQuantity(
                isIncrement: CounterOperationHelper.isIncrement(type));
          }

          return BottomNavigation(
            changeCountMethod: changeCountMethod,
            addToCartHandler: () {
              controller.cartHandler(product);
            },
            price: product.price!,
            count: controller.quantity,
          );
        },
      ),
    );
  }
}

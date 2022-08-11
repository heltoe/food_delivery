import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/helper/counter_operation.dart';
import 'package:food_delivery/models/recommended/product_recommended.dart';
import 'package:food_delivery/pages/recommended-food/components/header.dart';
import 'package:food_delivery/pages/recommended-food/components/hero_title.dart';
import 'package:food_delivery/pages/recommended-food/components/navigation/bottom_navigation.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/expandable_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetailPage extends StatelessWidget {
  const RecommendedFoodDetailPage({
    Key? key,
    required this.pageId,
  }) : super(key: key);
  final String pageId;

  @override
  Widget build(BuildContext context) {
    // init instance controller
    RecommendedProductController recommendedProductController =
        Get.find<RecommendedProductController>();
    CartController cartController = Get.find<CartController>();
    //
    ProductRecommended product;
    Iterable<ProductRecommended> productList = recommendedProductController
        .recommendedProductList
        .where((element) => element.id.toString() == pageId);

    if (productList.isNotEmpty) {
      product = productList.first;
      recommendedProductController.initProduct(product, cartController);
    } else {
      Get.toNamed(RouteHelper.getInitial());
      return const Scaffold();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: GetBuilder<RecommendedProductController>(builder: (controller) {
              return Header(countInCart: controller.inCartItems);
            }),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: HeroTitle(title: product.name!),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.urlToImage(product.img!),
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ExpandableText(text: product.description!),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<RecommendedProductController>(
        builder: (controller) {
          void changeCountMethod(int count) {
            controller.setQuantity(count);
          }

          return BottomNavigation(
            price: product.price!,
            count: controller.quantity,
            changeCountMethod: changeCountMethod,
            addToCartHandler: () {
              controller.cartHandler(product);
            },
          );
        },
      ),
    );
  }
}

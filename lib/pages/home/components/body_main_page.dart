import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/pages/home/components/list_cards/list_cards.dart';
import 'package:food_delivery/pages/home/components/list_cards/list_cards_title.dart';
import 'package:food_delivery/pages/home/components/main_food_slider/main_food_slider.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/common_wrapper.dart';
import 'package:get/get.dart';

class BodyMainPage extends StatelessWidget {
  const BodyMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoading
              ? const CircularProgressIndicator(color: AppColors.mainColor)
              : MainFoodSlider(productList: popularProducts.popularProductList);
        }),
        // MainFoodSlider(),
        SizedBox(height: Dimensions.height30),
        const CommonWrapper(widget: ListCardsTitle()),
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return recommendedProducts.isLoading
              ? const CircularProgressIndicator(color: AppColors.mainColor)
              : CommonWrapper(
                  widget: ListCards(
                      productList: recommendedProducts.recommendedProductList),
                );
        })
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery/models/recommended/product_recommended.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/card_food_content_container.dart';
import 'package:food_delivery/widgets/card_food_image.dart';
import 'package:food_delivery/widgets/food_main_info.dart';

class CardFood extends StatelessWidget {
  const CardFood({
    Key? key,
    required this.card,
  }) : super(key: key);
  final ProductRecommended card;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CardFoodImage(image: card.img!),
        CardFoodContentContainer(
          widget: FoodMainInfo(
            spaceSecondLine: Dimensions.height10,
            title: card.name!,
            stars: card.stars!.toDouble(),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:food_delivery/models/recommended/product_recommended.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/dimensions.dart';
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
        Container(
          width: Dimensions.heightImageCard,
          height: Dimensions.heightImageCard,
          margin: EdgeInsets.only(bottom: Dimensions.height10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.height20),
            color: Colors.white38,
            image: DecorationImage(
              image: NetworkImage(AppConstants.urlToImage(card.img!)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.height20),
                bottomRight: Radius.circular(Dimensions.height20),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.width10),
              child: FoodMainInfo(
                spaceSecondLine: Dimensions.height10,
                title: card.name!,
                stars: card.stars!.toDouble(),
              ),
            ),
          ),
        )
      ],
    );
  }
}

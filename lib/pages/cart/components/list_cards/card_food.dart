import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/widgets/card_food_content_container.dart';
import 'package:food_delivery/widgets/card_food_image.dart';
import 'package:food_delivery/widgets/common_wrapper.dart';
import 'package:food_delivery/widgets/counter_controller/plus_minus_controller.dart';
import 'package:food_delivery/widgets/small_text.dart';

class CardFood extends StatelessWidget {
  const CardFood({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.clickHandler,
    required this.clickCard,
    required this.count,
  }) : super(key: key);
  final String image;
  final String title;
  final int price;
  final int count;
  final void Function(int count) clickHandler;
  final void Function() clickCard;

  @override
  Widget build(BuildContext context) {
    return CommonWrapper(
      widget: GestureDetector(
        onTap: () {
          clickCard();
        },
        child: Row(
          children: [
            CardFoodImage(image: image),
            CardFoodContentContainer(
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: title,
                    color: Colors.black54,
                  ),
                  SizedBox(height: Dimensions.height10),
                  const SmallText(text: "Spicy"),
                  SizedBox(height: Dimensions.height20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(text: "\$ $price", color: Colors.redAccent),
                      PlusMinusController(
                        clickHandler: clickHandler,
                        count: count,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

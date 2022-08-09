import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/widgets/block_with_icon.dart';
import 'package:food_delivery/widgets/food_main_info.dart';
import 'package:food_delivery/widgets/small_text.dart';

class CardFood extends StatelessWidget {
  const CardFood({
    Key? key,
  }) : super(key: key);

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
              image: AssetImage("assets/images/food1.png"),
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
                title: "Chinese Side",
              ),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/widgets/block_with_icon.dart';
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
            borderRadius:
            BorderRadius.circular(Dimensions.height20),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(text: "Bitter Orange Marinade"),
                  SizedBox(height: Dimensions.height10),
                  SmallText(text: "1287 comments"),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      BlockWithIcon(
                        text: "Normal",
                        icon: Icons.circle_sharp,
                        iconColor: AppColors.iconColor1,
                      ),
                      BlockWithIcon(
                        text: "1.7km",
                        icon: Icons.location_on,
                        iconColor: AppColors.mainColor,
                      ),
                      BlockWithIcon(
                        text: "32min",
                        icon: Icons.access_time_rounded,
                        iconColor: AppColors.iconColor2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
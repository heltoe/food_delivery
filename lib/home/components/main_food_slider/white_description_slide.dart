import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/widgets/block_with_icon.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:food_delivery/widgets/stars.dart';

class WhiteDescriptionSlide extends StatelessWidget {
  const WhiteDescriptionSlide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: Dimensions.pageViewTextContainerHeight,
        margin: EdgeInsets.only(
          left: Dimensions.width30,
          right: Dimensions.width30,
          bottom: Dimensions.height30,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFe8e8e8),
              blurRadius: 5.0,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5, 0),
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(5, 0),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 15, vertical: Dimensions.height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(text: "Bitter Orange Marinade"),
              SizedBox(height: Dimensions.height10),
              Row(
                children: const [
                  Stars(filledStars: 5),
                  SizedBox(width: 10),
                  SmallText(text: "4.5"),
                  SizedBox(width: 10),
                  SmallText(text: "1287 comments"),
                ],
              ),
              SizedBox(height: Dimensions.height20),
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
    );
  }
}

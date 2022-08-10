import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/widgets/block_with_icon.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:food_delivery/widgets/stars.dart';

class FoodMainInfo extends StatelessWidget {
  const FoodMainInfo({
    Key? key,
    this.spaceFirstLine = 0,
    this.spaceSecondLine = 0,
    this.sizeTitle = 0,
    required this.title,
    required this.stars,
  }) : super(key: key);
  final double spaceFirstLine;
  final double spaceSecondLine;
  final String title;
  final double sizeTitle;
  final double stars;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText(text: title, size: sizeTitle == 0 ? Dimensions.height20 : sizeTitle),
        SizedBox(
            height: spaceFirstLine == 0 ? Dimensions.height10 : spaceFirstLine),
        Row(
          children: [
            Stars(filledStars: stars),
            const SizedBox(width: 10),
            SmallText(text: stars.toString()),
            const SizedBox(width: 10),
            SmallText(text: "1287 comments"),
          ],
        ),
        SizedBox(
            height:
                spaceSecondLine == 0 ? Dimensions.height20 : spaceSecondLine),
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
    );
  }
}

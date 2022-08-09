import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseText(text: "Country", color: AppColors.mainColor),
            Row(
              children: [
                SmallText(text: "City", color: Colors.black54),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ],
        ),
        Center(
          child: Container(
            width: Dimensions.height45,
            height: Dimensions.height45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.height15),
              color: AppColors.mainColor,
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: Dimensions.height24,
            ),
          ),
        )
      ],
    );
  }
}

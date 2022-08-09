import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: Dimensions.heightDetailFoodImage,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/food1.png"),
          fit: BoxFit.cover,
        ),
        color: Colors.red,
      ),
    );
  }
}

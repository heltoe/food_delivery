import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/dimensions.dart';

class CardFoodImage extends StatelessWidget {
  const CardFoodImage({
    Key? key,
    this.height = 0,
    this.width = 0,
    this.borderRadius = 0,
    required this.image,
  }) : super(key: key);
  final double width;
  final double height;
  final double borderRadius;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == 0 ? Dimensions.heightImageCard : width,
      height: height == 0 ? Dimensions.heightImageCard : height,
      margin: EdgeInsets.only(bottom: Dimensions.height10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius == 0 ? Dimensions.height20 : borderRadius),
        color: Colors.white38,
        image: DecorationImage(
          image: NetworkImage(AppConstants.urlToImage(image)),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

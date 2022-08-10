import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/dimensions.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
    Key? key, required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: Dimensions.heightDetailFoodImage,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(AppConstants.urlToImage(image)),
          fit: BoxFit.cover,
        ),
        color: Color(0xFF59c5df),
      ),
    );
  }
}

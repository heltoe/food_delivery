import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/food_main_info.dart';

class WhiteDescriptionSlide extends StatelessWidget {
  const WhiteDescriptionSlide({
    Key? key,
    required this.title,
    required this.stars,
  }) : super(key: key);
  final String title;
  final double stars;

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
            horizontal: Dimensions.width15,
            vertical: Dimensions.height10,
          ),
          child: FoodMainInfo(title: title, stars: stars,),
        ),
      ),
    );
  }
}

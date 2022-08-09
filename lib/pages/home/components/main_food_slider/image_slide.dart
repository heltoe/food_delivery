import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class ImageSlide extends StatelessWidget {
  const ImageSlide({
    Key? key,
    required double baseHeight, required this.index,
  }) : _baseHeight = baseHeight, super(key: key);

  final double _baseHeight;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _baseHeight,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.height30),
        color: index.isEven ? Color(0xFF59c5df) : Color(0xFF9294cc),
        image: DecorationImage(
          image: AssetImage("assets/images/food1.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
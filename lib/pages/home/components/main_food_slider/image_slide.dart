import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/dimensions.dart';

class ImageSlide extends StatelessWidget {
  const ImageSlide({
    Key? key,
    required double baseHeight,
    required this.image,
    required this.index,
  })  : _baseHeight = baseHeight,
        super(key: key);

  final double _baseHeight;
  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _baseHeight,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.height30),
        color: index.isEven ? const Color(0xFF59c5df) : const Color(0xFF9294cc),
        image: DecorationImage(
          image: NetworkImage(AppConstants.urlToImage(image)),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

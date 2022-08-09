import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class BaseText extends StatelessWidget {
  const BaseText({
    Key? key,
    required this.text,
    this.color = AppColors.mainBlackColor,
    this.overflow = TextOverflow.ellipsis,
    this.size = 0,
    this.lineHeight = 1,
    this.maxLines = 1,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);
  final String text;
  final Color color;
  final double size;
  final double lineHeight;
  final int maxLines;
  final TextOverflow overflow;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: size == 0 ? Dimensions.height20 : size,
        fontWeight: fontWeight,
        color: color,
        fontFamily: 'Roboto',
        height: lineHeight,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/utils/colors.dart';


class SmallText extends StatelessWidget {
  const SmallText({
    Key? key,
    required this.text,
    this.color = AppColors.textColor,
    this.size = 12,
    this.lineHeight = 1.2,
  }) : super(key: key);
  final String text;
  final Color color;
  final double size;
  final double lineHeight;

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      color: color,
      size: size,
      overflow: TextOverflow.clip,
      lineHeight: lineHeight,
      maxLines: double.maxFinite.toInt(),
    );
  }
}

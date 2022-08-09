import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class BlockWithIcon extends StatelessWidget {
  const BlockWithIcon({
    Key? key,
    required this.text,
    this.textColor = AppColors.textColor,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);
  final String text;
  final Color textColor;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.height24,
        ),
        const SizedBox(width: 5),
        SmallText(text: text, color: textColor),
      ],
    );
  }
}

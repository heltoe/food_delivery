import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    Key? key,
    required this.icon,
    this.size = 40,
    this.iconSize = 0,
    this.backgroundColor = AppColors.defaultBackgroundIconColor,
    this.iconColor = AppColors.defaultIconColor,
    this.clickHandler,
  }) : super(key: key);
  final IconData icon;
  final double size;
  final double iconSize;
  final Color backgroundColor;
  final Color iconColor;
  final void Function()? clickHandler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (clickHandler != null) clickHandler!();
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor,
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize == 0 ? Dimensions.height16 : iconSize,
          ),
        ),
      ),
    );
  }
}

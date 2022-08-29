import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/base_text.dart';

class ToCartBtn extends StatelessWidget {
  const ToCartBtn({
    Key? key,
    required this.countInCart,
    this.size = 40,
    this.iconSize = 0,
    this.backgroundColor = AppColors.defaultBackgroundIconColor,
    this.iconColor = AppColors.defaultIconColor,
    this.clickHandler,
  }) : super(key: key);
  final int countInCart;
  final double size;
  final double iconSize;
  final Color backgroundColor;
  final Color iconColor;
  final void Function()? clickHandler;

  @override
  Widget build(BuildContext context) {
    clickBtn() {
      if (clickHandler != null && countInCart > 0) clickHandler!();
    }
    return GestureDetector(
      onTap: () {
        clickBtn();
      },
      child: Stack(
        children: [
          AppIcon(
            icon: Icons.shopping_cart_outlined,
            iconColor: iconColor,
            size: size,
            iconSize: iconSize,
            backgroundColor: backgroundColor,
            clickHandler: () {
              clickBtn();
            },
          ),
          countInCart > 0
              ? Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.mainColor,
                    child: BaseText(
                      text: countInCart.toString(),
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

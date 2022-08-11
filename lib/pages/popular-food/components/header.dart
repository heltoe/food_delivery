import 'package:flutter/material.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/to_cart_btn.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.countInCart,
  }) : super(key: key);
  final int countInCart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppIcon(
          icon: Icons.arrow_back_ios,
          clickHandler: () {
            Get.toNamed(RouteHelper.initial);
          },
        ),
        ToCartBtn(countInCart: countInCart),
      ],
    );
  }
}

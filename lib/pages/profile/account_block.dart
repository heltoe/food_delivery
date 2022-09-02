import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/base_text.dart';

class AccountBlock extends StatelessWidget {
  const AccountBlock({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.icon,
  }) : super(key: key);
  final String title;
  final Color backgroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.width10),
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20, vertical: Dimensions.width20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.height10),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(1, 1),
            color: Colors.grey.withOpacity(0.2),
          )
        ]
      ),
      child: Row(
        children: [
          AppIcon(
            icon: icon,
            backgroundColor: backgroundColor,
            iconColor: Colors.white,
            iconSize: Dimensions.height30,
            size: Dimensions.height50,
          ),
          SizedBox(width: Dimensions.width20),
          BaseText(text: title),
        ],
      ),
    );
  }
}

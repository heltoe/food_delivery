import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';

class Stars extends StatelessWidget {
  const Stars({
    Key? key,
    required this.filledStars,
  }) : super(key: key);
  final int filledStars;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: AppColors.mainColor,
          size: 15,
        ),
      ),
    );
  }
}

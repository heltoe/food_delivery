import 'package:flutter/material.dart';
import 'package:food_delivery/models/popular/product_popular.dart';
import 'package:food_delivery/widgets/expandable_text.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/widgets/common_wrapper.dart';
import 'package:food_delivery/widgets/food_main_info.dart';

class BodyDetailPage extends StatelessWidget {
  const BodyDetailPage({
    Key? key,
    required this.productPopular,
  }) : super(key: key);
  final ProductPopular productPopular;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.height20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.height20),
          topRight: Radius.circular(Dimensions.height20),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonWrapper(
            widget: FoodMainInfo(
              title: productPopular.name!,
              sizeTitle: Dimensions.height26,
              stars: productPopular.stars!.toDouble(),
            ),
          ),
          SizedBox(height: Dimensions.height30),
          const CommonWrapper(
            widget: BaseText(text: "Introduce"),
          ),
          SizedBox(height: Dimensions.height10),
          Expanded(
            child: SingleChildScrollView(
              child: ExpandableText(text: productPopular.description!),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart-history/cart_history_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/widgets/card_food_image.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:intl/intl.dart';

class CartHistoryItem extends StatelessWidget {
  const CartHistoryItem({
    Key? key,
    required this.itemHistoryCart,
  }) : super(key: key);

  final CartHistoryPerOrder itemHistoryCart;

  @override
  Widget build(BuildContext context) {

    Widget timeWidget() {
      var time = DateTime.now().toString();
      if (itemHistoryCart.time.isNotEmpty) {
        time = itemHistoryCart.time;
      }
      DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(time);
      DateTime inputDate = DateTime.parse(parseDate.toString());
      DateFormat outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
      String outputDate = outputFormat.format(inputDate);
      return BaseText(text: outputDate);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        timeWidget(),
        SizedBox(height: Dimensions.height10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                  itemHistoryCart.list.length > 3
                      ? 3
                      : itemHistoryCart.list.length, (indexList) {
                return CardFoodImage(
                  image: itemHistoryCart.list[indexList].img!,
                  marginBottom: 0,
                  marginRight: Dimensions.width10,
                  width: Dimensions.height80,
                  height: Dimensions.height80,
                );
              }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SmallText(text: "Total:", color: AppColors.titleColor),
                SizedBox(height: Dimensions.height5),
                BaseText(
                  text:
                  "${itemHistoryCart.list.length} ${itemHistoryCart.list.length > 1 ? "Items" : "Item"}",
                  color: AppColors.titleColor,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

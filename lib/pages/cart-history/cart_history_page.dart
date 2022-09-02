import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/pages/cart-history/cart_history_item.dart';
import 'package:food_delivery/pages/cart-history/custom_app_bar.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/widgets/common_wrapper.dart';
import 'package:food_delivery/widgets/empty_state.dart';
import 'package:get/get.dart';

class CartHistoryPerOrder {
  String time;
  List<CartItem> list;

  CartHistoryPerOrder({required this.time, required this.list});
}

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CartItem> cartHistoryList =
        Get.find<CartController>().getCartHistoryData();
    List<CartHistoryPerOrder> cartHistoryPerOrder = [];
    cartHistoryList.reversed.forEach((element) {
      int index =
          cartHistoryPerOrder.indexWhere((item) => item.time == element.time);
      if (index > -1) {
        int indexList = cartHistoryPerOrder[index]
            .list
            .indexWhere((item) => item.id == element.id);
        if (indexList == -1) {
          cartHistoryPerOrder[index].list.add(element);
        } else {
          int cartItemHistoryPerOrderQuantity =
              cartHistoryPerOrder[index].list[indexList].quantity!;
          cartHistoryPerOrder[index].list[indexList].quantity =
              cartItemHistoryPerOrderQuantity + element.quantity!;
        }
      } else {
        cartHistoryPerOrder
            .add(CartHistoryPerOrder(time: element.time!, list: [element]));
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(),
          // Expanded(
          //   child: EmptyState(title: "Empty Cart History"),
          // ),
          Expanded(
            child: cartHistoryPerOrder.isNotEmpty ? ListView.builder(
              itemCount: cartHistoryPerOrder.length,
              itemBuilder: (_, index) {
                CartHistoryPerOrder itemHistoryCart =
                cartHistoryPerOrder[index];
                return CommonWrapper(
                  widget: Container(
                    margin: EdgeInsets.only(bottom: Dimensions.height10),
                    child: CartHistoryItem(itemHistoryCart: itemHistoryCart),
                  ),
                );
              },
            ) : const EmptyState(title: "Your cart history is empty"),
          ),
        ],
      ),
    );
  }
}

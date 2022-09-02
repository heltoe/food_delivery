import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/pages/cart/components/header.dart';
import 'package:food_delivery/pages/cart/components/list_cards/list_cards.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_container_navigation.dart';
import 'package:food_delivery/widgets/base_navigation_button.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/widgets/empty_state.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void toCardFood(CartItem cardFood) {
      Get.toNamed(cardFood.isPopular!
          ? RouteHelper.getPopularFood(cardFood.id!)
          : RouteHelper.getRecommendedFood(cardFood.id!));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.height20 * 3,
            child: GetBuilder<CartController>(builder: (controller) {
              void backPage() {
                var pageId = Get.parameters['pageId'];
                final indexFood = controller.getListCartItems
                    .indexWhere((element) => element.id.toString() == pageId);
                if (indexFood != -1) {
                  toCardFood(controller.getListCartItems[indexFood]);
                }
              }

              return Header(backPage: backPage);
            }),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.height20 * 6,
            bottom: 0,
            child: Container(
              child: GetBuilder<CartController>(
                builder: (controller) {
                  return controller.getListCartItems.isNotEmpty ? ListCards(
                    list: controller.getListCartItems,
                    listListenerCardClick: (int index) {
                      toCardFood(controller.getListCartItems[index]);
                    },
                    listListenerClickerCount: ({
                      required int index,
                      required int count,
                    }) {
                      CartItem cartItem = controller.getListCartItems[index];
                      cartItem.quantity = count;
                      controller.changeQuantity(cartItem);
                      if (count == 0 && controller.getListCartItems.isEmpty) {
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                  ) : const EmptyState(title: "Your cart is empty");
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) {
          void changeCountMethod() {
            controller.addToHistoryList();
            Get.toNamed(RouteHelper.getInitial());
          }
          return BaseContainerNavigation(
            widgets: [
              BaseNavigationButton(
                widget: BaseText(text: "\$ ${controller.totalPriceItems}"),
                backgroundColor: Colors.white,
              ),
              BaseNavigationButton(
                widget: const BaseText(text: "Check out", color: Colors.white),
                backgroundColor: AppColors.mainColor,
                clickHandler: changeCountMethod,
              ),
            ],
          );
        },
      ),
    );
  }
}

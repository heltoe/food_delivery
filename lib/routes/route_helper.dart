import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/pages/popular-food/popular_food_detail_page.dart';
import 'package:food_delivery/pages/recommended-food/recommended_food_detail_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cart = "/cart";

  static String getInitial() => initial;

  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";

  static String getRecommendedFood(int pageId) =>
      "$recommendedFood?pageId=$pageId";

  static String getCart(int pageId) => "$cart?pageId=$pageId";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainFoodPage()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters["pageId"];
        return PopularFoodDetailPage(pageId: pageId!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters["pageId"];
        return RecommendedFoodDetailPage(pageId: pageId!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cart,
      page: () => const CartPage(),
      transition: Transition.fadeIn,
    ),
  ];
}

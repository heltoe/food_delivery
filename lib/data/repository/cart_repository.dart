import 'dart:convert';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  final SharedPreferences sharedPreferences;

  CartRepository({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<CartItem> cartList) {
    cart = [];
    cartList.forEach((element) => cart.add(jsonEncode(element)));
    sharedPreferences.setStringList(
        AppConstants.nameCartListInSharedPreference, cart);
  }

  List<CartItem> getCartList() {
    List<String> cartListString = [];
    if (sharedPreferences
        .containsKey(AppConstants.nameCartListInSharedPreference)) {
      cartListString = sharedPreferences
          .getStringList(AppConstants.nameCartListInSharedPreference)!;
    }
    List<CartItem> cartList = [];

    cartListString.forEach((element) => cartList.add(CartItem.fromJson(jsonDecode(element))));
    return cartList;
  }
}

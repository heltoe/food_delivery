import 'dart:convert';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  final SharedPreferences sharedPreferences;

  CartRepository({required this.sharedPreferences});

  List<String> _cart = [];
  List<String> _cartHistory = [];

  void addToCartList(List<CartItem> cartList) {
    _cart = [];
    cartList.forEach((element) => _cart.add(jsonEncode(element)));
    sharedPreferences.setStringList(
        AppConstants.nameCartListInSharedPreference, _cart);
  }

  void addToHistoryList() {
    if (sharedPreferences
        .containsKey(AppConstants.nameCartHistoryListInSharedPreference)) {
      _cartHistory = sharedPreferences
          .getStringList(AppConstants.nameCartHistoryListInSharedPreference)!;
    }
    DateTime time = DateTime.now();
    _cart.forEach((element) {
      // update time order
      CartItem parsedElement = CartItem.fromJson(jsonDecode(element));
      parsedElement.time = time.toString();
      _cartHistory.add(jsonEncode(parsedElement));
    });
    removeCart();
    sharedPreferences.setStringList(
        AppConstants.nameCartHistoryListInSharedPreference, _cartHistory);
  }

  void removeCart() {
    _cart = [];
    sharedPreferences.remove(AppConstants.nameCartListInSharedPreference);
  }

  void _removeCartHistory() {
    _cartHistory = [];
    sharedPreferences.remove(AppConstants.nameCartHistoryListInSharedPreference);
  }

  void clearCartAndCartHistoryByLogout() {
    removeCart();
    _removeCartHistory();
  }

  List<CartItem> getCartList() {
    return _getCommonCartItemList(AppConstants.nameCartListInSharedPreference);
  }

  List<CartItem> getCartHistoryList() {
    return _getCommonCartItemList(
        AppConstants.nameCartHistoryListInSharedPreference);
  }

  List<CartItem> _getCommonCartItemList(String nameEssence) {
    List<String> cartListString = [];
    if (sharedPreferences.containsKey(nameEssence)) {
      cartListString = sharedPreferences.getStringList(nameEssence)!;
    }
    List<CartItem> cartList = [];

    cartListString.forEach(
        (element) => cartList.add(CartItem.fromJson(jsonDecode(element))));
    return cartList;
  }
}

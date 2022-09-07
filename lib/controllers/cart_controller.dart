import 'package:food_delivery/data/repository/cart_repository.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepository cartRepository;

  CartController({required this.cartRepository});

  Map<int, CartItem> _items = {};

  Map<int, CartItem> get items => _items;

  List<CartItem> get getListCartItems =>
      _items.entries.map((e) => e.value).toList();

  List<CartItem> _storageItems = [];
  List<CartItem> getCartData() {
    setCart = cartRepository.getCartList();
    return _storageItems;
  }

  List<CartItem> getCartHistoryData() {
    return cartRepository.getCartHistoryList();
  }

  set setCart(List<CartItem> items) {
    _storageItems = items;
    _storageItems.forEach((element) => _items.putIfAbsent(element.id!, () => element));
  }

  int get totalPriceItems {
    int totalPrice = 0;
    _items.forEach((key, value) {
      int totalPriceProduct = value.price! * value.quantity!;
      totalPrice += totalPriceProduct;
    });
    return totalPrice;
  }

  bool _baseCondition(CartItem product) {
    return _items.containsKey((product.id!));
  }

  bool isExistInCart(CartItem product) {
    return _baseCondition(product);
  }

  void addToHistoryList() {
    cartRepository.addToHistoryList();
    _clearCart();
  }

  void changeQuantity(CartItem product) {
    if (product.quantity == 0) {
      _removeItem(product);
    } else {
      _changeCardItem(product);
    }

    cartRepository.addToCartList(getListCartItems);
    update();
  }

  void _changeCardItem(CartItem product) {
    if (_baseCondition(product)) {
      if (_items[product.id]?.quantity != product.quantity) {
        _items.update(product.id!, (value) => product);
      }
    } else {
      _items.putIfAbsent(product.id!, () => product);
    }
  }

  void _removeItem(CartItem product) {
    if (_baseCondition(product)) _items.remove(product.id);
  }

  void _clearCart() {
    _items = {};
    update();
  }

  void clearCartAndCartHistoryByLogout() {
    _clearCart();
    _storageItems = [];
    cartRepository.clearCartAndCartHistoryByLogout();
    update();
  }
}

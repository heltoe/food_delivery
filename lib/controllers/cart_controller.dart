import 'package:food_delivery/data/repository/cart_repository.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepository cartRepository;

  CartController({required this.cartRepository});

  Map<int, CartItem> _items = {};

  Map<int, CartItem> get items => _items;

  bool _baseCondition(CartItem product) {
    return _items.containsKey((product.id!));
  }

  bool isExistInCart(CartItem product) {
    return _baseCondition(product);
  }

  void changeQuantity(CartItem product) {
    if (product.quantity == 0) {
      _removeItem(product);
    } else {
      _changeCardItem(product);
    }
    print(_items);
    update();
  }

  void _changeCardItem (CartItem product) {
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

  void clearCart() {
    _items = {};
    update();
  }
}

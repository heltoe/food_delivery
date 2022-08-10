import 'package:food_delivery/models/popular/product_popular.dart';

class ProductListPopular {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductPopular> _products;
  List<ProductPopular> get products => _products;

  ProductListPopular({
    required totalSize,
    required typeId,
    required offset,
    required products,
  }) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _products = products;
  }

  ProductListPopular.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductPopular>[];
      json['products'].forEach((v) {
        _products.add(ProductPopular.fromJson(v));
      });
    }
  }
}

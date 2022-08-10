import 'package:food_delivery/models/recommended/product_recommended.dart';

class ProductListRecommended {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductRecommended> _products;
  List<ProductRecommended> get products => _products;

  ProductListRecommended({
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

  ProductListRecommended.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductRecommended>[];
      json['products'].forEach((v) {
        products.add(new ProductRecommended.fromJson(v));
      });
    }
  }
}


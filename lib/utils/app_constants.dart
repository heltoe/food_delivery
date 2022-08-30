class AppConstants {
  static const String appName = "DBFood";
  static const int appVersion = 1;
  static const String baseUrl = "http://mvs.bslmeiyu.com";
  static const String popularProductUri = "/api/v1/products/popular";
  static const String recommendedProductUri = "/api/v1/products/recommended";
  static const String token = "DBtoken";
  static const String nameCartListInSharedPreference = "CART_LIST";
  static String urlToImage(String path) => "${AppConstants.baseUrl}/uploads/$path";
}
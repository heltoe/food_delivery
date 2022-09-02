class AppConstants {
  static const String appName = "DBFood";
  static const int appVersion = 1;
  static const String baseUrl = "http://mvs.bslmeiyu.com";
  static const String popularProductUri = "/api/v1/products/popular";
  static const String recommendedProductUri = "/api/v1/products/recommended";
  static const String token = "DBtoken";
  static const String nameCartListInSharedPreference = "CART_LIST";
  static const String nameCartHistoryListInSharedPreference = "CART_HISTORY_LIST";
  static const String profileEmailSharedPreference = "PROFILE_EMAIL";
  static const String profilePasswordSharedPreference = "PROFILE_PASSWORD";
  static const String profileNameSharedPreference = "PROFILE_NAME";
  static const String profilePhoneSharedPreference = "PROFILE_PHONE";
  static String urlToImage(String path) => "${AppConstants.baseUrl}/uploads/$path";
}
class AppConstants {
  static const String appName = "DBFood";
  static const int appVersion = 1;
  static const String baseUrl = "http://mvs.bslmeiyu.com";
  static const String popularProductUri = "/api/v1/products/popular";
  static const String recommendedProductUri = "/api/v1/products/recommended";
  // auth
  static const String registrationUri = "/api/v1/auth/register";
  static const String loginUri = "/api/v1/auth/login";
  //
  static const String userInfoUri = "/api/v1/customer/info";
  //
  static const String nameCartListInSharedPreference = "CART_LIST";
  static const String nameCartHistoryListInSharedPreference = "CART_HISTORY_LIST";
  //
  static const String profileDataSharedPreference = "PROFILE_DATA";
  static const String nameTokenInSharedPreference = "PROFILE_TOKEN";
  static const String nameLastTimeRequestedProfileSharedPreference = "LAST_TIME_REQUESTED_PROFILE";
  static String urlToImage(String path) => "${AppConstants.baseUrl}/uploads/$path";
}
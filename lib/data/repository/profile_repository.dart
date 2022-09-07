import 'dart:convert';

import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/profile_data.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  ProfileRepository({required this.apiClient, required this.sharedPreferences});

  String getToken() {
    String token = "";
    if (sharedPreferences
        .containsKey(AppConstants.nameTokenInSharedPreference)) {
      token = sharedPreferences
          .getString(AppConstants.nameTokenInSharedPreference)!;
    }
    return token;
  }

  ProfileData getProfileData() {
    ProfileData profileData = ProfileData.clearData();
    if (sharedPreferences
        .containsKey(AppConstants.profileDataSharedPreference)) {
      var stringProfileData = sharedPreferences
          .getString(AppConstants.profileDataSharedPreference)!;
      profileData = ProfileData.fromLocalJson(jsonDecode(stringProfileData));
    }
    return profileData;
  }

  void setLastTimeRequestedProfile() {
    int lastTimeRequestedProfile = DateTime.now().microsecondsSinceEpoch;
    sharedPreferences.setInt(
        AppConstants.nameLastTimeRequestedProfileSharedPreference,
        lastTimeRequestedProfile);
  }

  DateTime getLastTimeRequestedProfile() {
    DateTime lastTimeRequestedProfile = DateTime.now().subtract(const Duration(hours: 25));
    if (sharedPreferences.containsKey(
        AppConstants.nameLastTimeRequestedProfileSharedPreference)) {
      int timeStamp = sharedPreferences
          .getInt(AppConstants.nameLastTimeRequestedProfileSharedPreference)!;
      lastTimeRequestedProfile = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    }
    return lastTimeRequestedProfile;
  }

  void addProfileDataToSharedPreference(ProfileData profileData) {
    sharedPreferences.setString(
        AppConstants.profileDataSharedPreference, jsonEncode(profileData));
  }

  void removeProfileDataInSharedPreference() {
    sharedPreferences.remove(AppConstants.profileDataSharedPreference);
    sharedPreferences.remove(AppConstants.nameLastTimeRequestedProfileSharedPreference);
    sharedPreferences.remove(AppConstants.nameTokenInSharedPreference);
    apiClient.updateHeader("");
  }

  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.userInfoUri);
  }
}

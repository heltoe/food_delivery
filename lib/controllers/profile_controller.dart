import 'package:food_delivery/data/repository/profile_repository.dart';
import 'package:food_delivery/models/profile_data.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileRepository profileRepository;

  ProfileController({ required this.profileRepository });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ProfileData _profileData = ProfileData.clearData();
  ProfileData get profileData => _profileData;

  String _token = "";
  String getToken() {
    setToken = profileRepository.getToken();
    return _token;
  }
  set setToken(String token) {
    _token = token;
  }


  void logout() {
    _clearProfileData();
    update();
  }

  void _setProfileData (ProfileData profileData) {
    _profileData = profileData;
    profileRepository.addProfileDataToSharedPreference(profileData);
    update();
  }

  void _clearProfileData () {
    _profileData = ProfileData.clearData();
    profileRepository.removeProfileDataInSharedPreference();
    update();
  }

  getUserInfo() {
    DateTime currentTime = DateTime.now();
    DateTime lastTimeRequestedProfileModify = profileRepository.getLastTimeRequestedProfile();
    bool isAfter = currentTime.isAfter(lastTimeRequestedProfileModify);
    if (isAfter) {
      fetchUserInfo();
    } else {
      _setProfileData(profileRepository.getProfileData());
    }
  }

  Future<void> fetchUserInfo() async {
    _isLoading = true;
    update();
    Response response = await profileRepository.getUserInfo();
    if (response.statusCode == 200) {
      ProfileData localProfile = ProfileData.fromJson(response.body);
      _setProfileData(localProfile);
      profileRepository.setLastTimeRequestedProfile();
    }
    _isLoading = false;
    update();
  }
}
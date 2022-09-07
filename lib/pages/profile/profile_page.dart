import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/profile_controller.dart';
import 'package:food_delivery/helper/profile_cards_helper.dart';
import 'package:food_delivery/models/profile_data.dart';
import 'package:food_delivery/pages/profile/account_block.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/widgets/common_wrapper.dart';
import 'package:get/get.dart';

class ProfileCardInfo {
  String title;
  IconData icon;
  ProfileCardType type;
  Color backgroundColor;

  ProfileCardInfo({
    required this.title,
    required this.icon,
    required this.type,
    required this.backgroundColor,
  });
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find<ProfileController>();
    CartController cartController = Get.find<CartController>();
    ProfileData profileData = profileController.profileData;
    String getPlacedText (String profileValue, String placeholder) {
      return profileValue.isEmpty ? placeholder : profileValue;
    }
    List<ProfileCardInfo> listCardInfo = [
      ProfileCardInfo(
        title: getPlacedText(profileData.name, "Fill your name"),
        icon: Icons.person,
        type: ProfileCardType.name,
        backgroundColor: AppColors.mainColor,
      ),
      ProfileCardInfo(
        title: getPlacedText(profileData.phone, "Fill your number phone"),
        icon: Icons.phone,
        type: ProfileCardType.phone,
        backgroundColor: AppColors.yellowColor,
      ),
      ProfileCardInfo(
        title: getPlacedText(profileData.email, "Fill your email"),
        icon: Icons.email,
        type: ProfileCardType.email,
        backgroundColor: AppColors.yellowColor,
      ),
      ProfileCardInfo(
        title: "Fill your address",
        icon: Icons.location_on,
        type: ProfileCardType.home,
        backgroundColor: AppColors.yellowColor,
      ),
      ProfileCardInfo(
        title: "Logout",
        icon: Icons.logout,
        type: ProfileCardType.logout,
        backgroundColor: Colors.redAccent,
      ),
    ];

    void tappedCard(ProfileCardType type) {
      switch(type) {
        case ProfileCardType.logout:
          cartController.clearCartAndCartHistoryByLogout();
          profileController.logout();
          Get.toNamed(RouteHelper.getLogin());
          break;
        default:
          print(type);
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(
          child: BaseText(
            text: "Profile",
            size: Dimensions.height24,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height75,
              size: Dimensions.height150,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: listCardInfo.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      tappedCard(listCardInfo[index].type);
                    },
                    child: CommonWrapper(
                      widget: AccountBlock(
                        title: listCardInfo[index].title,
                        backgroundColor: listCardInfo[index].backgroundColor,
                        icon: listCardInfo[index].icon,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

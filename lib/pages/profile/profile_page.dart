import 'package:flutter/material.dart';
import 'package:food_delivery/helper/profile_cards_helper.dart';
import 'package:food_delivery/pages/profile/account_block.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/widgets/common_wrapper.dart';

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
    List<ProfileCardInfo> listCardInfo = [
      ProfileCardInfo(
        title: "Fill your name",
        icon: Icons.person,
        type: ProfileCardType.name,
        backgroundColor: AppColors.mainColor,
      ),
      ProfileCardInfo(
        title: "Fill your number phone",
        icon: Icons.phone,
        type: ProfileCardType.phone,
        backgroundColor: AppColors.yellowColor,
      ),
      ProfileCardInfo(
        title: "Fill your email",
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
    ];
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
                  return CommonWrapper(
                    widget: AccountBlock(
                      title: listCardInfo[index].title,
                      backgroundColor: listCardInfo[index].backgroundColor,
                      icon: listCardInfo[index].icon,
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

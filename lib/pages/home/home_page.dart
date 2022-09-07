import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart-history/cart_history_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/pages/profile/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MenuItem {
  IconData icon;
  String title;

  MenuItem({ required this.icon, required this.title });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersistentTabController _controller;
  List<Widget> _buildScreens() {
    return [
      const MainFoodPage(),
      const CartHistory(),
      const ProfilePage(),
    ];
  }

  final List<MenuItem> _menuItems = [
    MenuItem(icon: CupertinoIcons.home, title: "Home"),
    MenuItem(icon: CupertinoIcons.cart_fill, title: "Cart"),
    MenuItem(icon: CupertinoIcons.person, title: "Me"),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: List.generate(_menuItems.length, (index) {
        IconData icon = _menuItems[index].icon;
        String title = _menuItems[index].title;
        return PersistentBottomNavBarItem(
          icon: Icon(icon),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        );
      }),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style2, // Choose the nav bar style with this property.
    );
  }
}

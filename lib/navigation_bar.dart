import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/feature/consultation/pages/consultation_page.dart';
import 'package:hackathon_app/feature/profile/pages/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  late PersistentTabController _controller;

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
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 350),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 350),
      ),
      navBarStyle:
          NavBarStyle.style7, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      ConsultationPage(),
      ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.chat,
          color: Colors.white,
        ),
        inactiveIcon: Icon(
          Icons.chat,
          color: Style.grayColor,
        ),
        title: "Konsultasi",
        textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        activeColorSecondary: Colors.white,
        activeColorPrimary: Style.primaryColor,
        inactiveColorPrimary: Style.grayColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person_outline_sharp,
          color: Colors.white,
        ),
        inactiveIcon: Icon(
          Icons.person_outline_sharp,
          color: Style.grayColor,
        ),
        title: "Profil",
        textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        activeColorSecondary: Colors.white,
        activeColorPrimary: Style.primaryColor,
        inactiveColorPrimary: Style.grayColor,
      ),
    ];
  }
}

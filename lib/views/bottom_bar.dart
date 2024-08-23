import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/views/download/download_screen.dart';
import 'package:netflixclone/views/profile/profile_screen.dart';
import 'package:netflixclone/views/search/search_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'home/home_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const SearchScreen(),
      const DownloadScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        inactiveIcon: const Icon(Icons.home_outlined),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        inactiveIcon: const Icon(Icons.search_outlined),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.download),
        inactiveIcon: const Icon(Icons.download_outlined),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        inactiveIcon: const Icon(Icons.person_outline),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  Future<bool> _onWillPop(BuildContext? context) async {
    if (_controller.index != 0) {
      _controller.jumpToTab(0); // Go to the first tab if not already there
      return false;
    } else {
      final shouldExit = await showDialog(
        context: context!,
        builder: (context) => AlertDialog(
          elevation: 2,
          shadowColor: AppColors.white,
          title: Text(
            'Exit App?',
            style: AppTextStyles.title.copyWith(color: AppColors.redColor,letterSpacing: 1.2),
          ),
          content: const Text(
            'Are you sure you want to exit the app?',
            style: AppTextStyles.normalText,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          actions: [
            InkWell(
              onTap: () => Navigator.of(context).pop(false),
              child: Container(
                width: 70,height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.grey,
                ),
                child: const Center(child: Text('No',style: AppTextStyles.normalText,)),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).pop(true),
              child: Container(
                width: 70,height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.red,
                ),
                child: const Center(child: Text('Yes',style: AppTextStyles.normalText,),),
              ),
            ),
          ],
        ),
      );
      return shouldExit ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: Colors.black,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(6.0),
        ),
        navBarStyle: NavBarStyle.style6, // Style 6 for icons-only bottom navigation
        onWillPop: _onWillPop, // Custom back button handling
      ),
    );
  }
}

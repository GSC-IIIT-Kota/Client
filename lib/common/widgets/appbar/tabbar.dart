import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/device/device_utility.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PTabBar extends StatelessWidget implements PreferredSizeWidget {
  const PTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? Colors.black : TColors.satin,
      child: TabBar(
        tabs: tabs,
        isScrollable: false,
        indicatorColor: TColors.rani,
        labelColor: dark ? Colors.white : TColors.rani,
        unselectedLabelColor: TColors.battleship,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}

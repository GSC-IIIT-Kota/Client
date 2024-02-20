import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/features/chatbot/screens/chat.dart';
import 'package:solution_challenge/features/donate/screens/ngo/ngo.dart';
import 'package:solution_challenge/features/education/screens/resources/resources.dart';
import 'package:solution_challenge/features/personalization/screens/settings/settings.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
          controller.selectedIndex.value = index,
          backgroundColor: dark ? TColors.myblack : Colors.white,
          indicatorColor: dark
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.house), label: 'Home'),
            NavigationDestination(
                icon: Icon(Iconsax.messages_2), label: 'Chat'),
            NavigationDestination(
                icon: Icon(Iconsax.money_send), label: 'Donate'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const EducationScreen(),
    const ChatScreen(),
    const NgoScreen(),
    const SettingsScreen()
  ];
}

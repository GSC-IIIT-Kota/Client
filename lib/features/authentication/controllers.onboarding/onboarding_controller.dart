import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// jump to specific dot selected page
  void dotNavigationClick(double index) {
    currentPageIndex.value = index.toInt();
    pageController.jumpToPage(index.toInt());
  }

  /// Update current index and jump to next page
  void nextPage() {
    if(currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen());
    }
    else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update current index and jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:solution_challenge/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:solution_challenge/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:solution_challenge/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:solution_challenge/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: translatedStrings?[0] ?? "Explore your cycle",
                subTitle:
                    translatedStrings?[1] ?? "Access educational resources and valuable content for a healthier menstrual journey.",
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: translatedStrings?[2] ?? "Your Personal Guide",
                subTitle:
                translatedStrings?[3] ?? "Meet Paddy, Your Personal Chatbot Companion — ask questions freely, keep secrets private, and get personalized advice.",
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: translatedStrings?[4] ?? "Empower Change Through Donation and Engagement",
                subTitle:
                translatedStrings?[5] ?? "Support Causes, Share Stories, and Connect with Like-minded Individuals.",
              ),
            ],
          ),

          /// Skip button
          const OnBoardingSkip(),

          /// Dot navigation smooth page indicator
          const OnBoardingDotNavigation(),

          /// Circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}

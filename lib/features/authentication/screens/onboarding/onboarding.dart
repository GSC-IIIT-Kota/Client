import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:solution_challenge/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:solution_challenge/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:solution_challenge/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:solution_challenge/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';

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
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: "Explore Your Cycle",
                subTitle:
                    "Access educational resources and valuable content for a healthier menstrual journey.",
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: "Your Personal Guide",
                subTitle:
                    "Chatbot support—ask questions freely, keep secrets private, and get personalized advice.",
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: "Curated for You",
                subTitle:
                    "Discover a range of menstrual products catering to your comfort and well-being.",
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

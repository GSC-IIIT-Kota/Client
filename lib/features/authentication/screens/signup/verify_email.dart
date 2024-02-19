import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/common/widgets/success_screen/success_screen.dart';
import 'package:solution_challenge/features/authentication/screens/login/login.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// image
              Image(
                image: const AssetImage(TImages.verifyEmailImage),
                width: PHelperFunctions.screenWidth() * 0.9,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Title & Subtitle
              Text(
                translatedStrings?[29] ?? "Verify your email address",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                "testemail@gmail.com",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                translatedStrings?[30] ?? "Confirm your email address to unlock full access to Period's menstrual health resources.",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => SuccessScreen(
                        image: TImages.confirmedEmailImage,
                        title: translatedStrings?[67] ?? "Welcome to Period!",
                        subTitle:
                            translatedStrings?[31] ?? "Your email has been successfully verified. Enjoy full access to menstrual health resources and community support.",
                        onPressed: () => Get.to(() => const LoginScreen()),
                      )),
                  child: Text(translatedStrings?[32] ?? "Continue"),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: TColors.rani,
                  ),
                  child: Text(translatedStrings?[33] ?? "Resend Email"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

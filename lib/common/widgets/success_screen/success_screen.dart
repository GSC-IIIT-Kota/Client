import 'package:flutter/material.dart';
import 'package:solution_challenge/common/styles/spacing_styles.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
    this.backgroundColor,
    this.textColor});

  final Color? backgroundColor, textColor;
  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [

              ///Image
              Image(
                image: AssetImage(image),
                width: PHelperFunctions.screenWidth() * 0.9,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Title & Subtitle
              Text(
                title,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: textColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                subTitle,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(TColors.satin),
                      foregroundColor: MaterialStateProperty.all<Color>(TColors.rani),
                    ),
                    child: Text(translatedStrings?[32] ?? "Continue")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/ngo/progress_bar.dart';
import 'package:solution_challenge/features/education/screens/course_screen.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:get/get.dart';

class PCourseTile extends StatelessWidget {
  const PCourseTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const CourseScreen()),
      child: PRoundedContainer(
        radius: 40,
        width: PHelperFunctions.screenWidth(),
        height: 330,
        backgroundColor: TColors.brightpink,
        child: Padding(
          padding: const EdgeInsets.only(
              right: TSizes.xl, left: TSizes.xl, top: TSizes.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(TImages.courseThumbnail),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                translatedStrings?[40] ?? 'Beginners guide to menstrual health',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const PProgressBar(
                progressValue: 0.4,
                backgroundColor: TColors.accent,
                progressColor: TColors.rani,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '40% Completed',
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        translatedStrings?[32] ?? 'Continue',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
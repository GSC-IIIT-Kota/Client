import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Course Appbar
            PAppBar(
              showBackArrow: true,
              title: Text(
                translatedStrings?[43] ?? 'Course Details',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.black),
              ),
            ),

            ///Thumbnail
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
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
                        .apply(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  PLessonCard(
                    itemNumber: 1,
                    title: translatedStrings?[44] ?? 'Introduction',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  PLessonCard(
                    itemNumber: 2,
                    title: translatedStrings?[68] ?? 'What are periods?',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  PLessonCard(
                    itemNumber: 3,
                    title: translatedStrings?[45] ?? 'What is menopause',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  PLessonCard(
                    itemNumber: 4,
                    title: translatedStrings?[46] ?? 'What do women have discomfort?',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PLessonCard extends StatelessWidget {
  const PLessonCard({
    super.key,
    required this.itemNumber,
    required this.title,
  });

  final int itemNumber;
  final String title;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return PRoundedContainer(
      height: 80,
      width: PHelperFunctions.screenWidth(),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dark
                        ? TColors.myblack.withOpacity(0.8)
                        : TColors.accent
                            .withOpacity(0.8), // You can change the color
                  ),
                  child: Center(
                    child: Text(
                      '$itemNumber',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),

                Container(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(left: TSizes.spaceBtwItems),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: Colors.black, fontWeightDelta: 2),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                  ),
                ),
              ],
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dark
                    ? TColors.myblack.withOpacity(0.8)
                    : TColors.accent
                        .withOpacity(0.8), // You can change the color
              ),
              child: const Center(
                child: Icon(
                  Iconsax.document,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

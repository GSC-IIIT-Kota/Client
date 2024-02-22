import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/education/course/course_lesson_card.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Course Appbar
            PAppBar(
              showBackArrow: true,
              backArrowColor: dark ? Colors.white : Colors.black,
              title: Text(
                translatedStrings?[43] ?? 'Course Details',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: dark ? Colors.white : Colors.black),
              ),
            ),

            ///Thumbnail
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const Image(
                    image: AssetImage(TImages.courseThumbnail),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Text(
                    translatedStrings?[40] ??
                        'Beginners guide to menstrual health',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: dark ? Colors.white : Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const PLessonCard(
                    itemNumber: 1,
                    title: 'Introduction: What are periods?',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const PLessonCard(
                    itemNumber: 2,
                    title: 'When will i get my first period?',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const PLessonCard(
                    itemNumber: 3,
                    title: 'What does the first period feel like?',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const PLessonCard(
                    itemNumber: 4,
                    title: "Period Hygiene 101: A Clean Queen's Manual?",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const PLessonCard(
                    itemNumber: 6,
                    title: "Cramp 101: Taming Period Pain",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const PLessonCard(
                    itemNumber: 7,
                    title: "Period Sidekick 101: A Pocket Guide",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const PLessonCard(
                    itemNumber: 8,
                    title: "Periods at School: A Quick Survival Guide",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const PLessonCard(
                    itemNumber: 9,
                    title: "Stain S.O.S.: Dress Edition",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const PLessonCard(
                    itemNumber: 10,
                    title: "First Period Party: Your Quick Guide",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const PLessonCard(
                    itemNumber: 11,
                    title: "Periods Unveiled: The Ultimate Guide for Girls",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const PLessonCard(
                    itemNumber: 12,
                    title: "Menopause Mystery Unveiled",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const PLessonCard(
                    itemNumber: 13,
                    title: "Period Products 101: Your Handy Guide",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const PLessonCard(
                    itemNumber: 14,
                    title: "Here's More",
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

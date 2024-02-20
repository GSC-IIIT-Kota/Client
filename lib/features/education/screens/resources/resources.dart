import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:solution_challenge/common/widgets/education/articles/home_article_column.dart';
import 'package:solution_challenge/common/widgets/education/videos/video_card.dart';
import 'package:solution_challenge/features/education/screens/resources/widgets/education_course_tile.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/features/education/screens/resources/widgets/education_appbar.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../common/widgets/viewall/viewall_cards.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// AppBar
            const PEducationAppbar(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            ///SearchBar
            const PSearchContainer(
              text: "Search Resources",
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            ///Body
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Course
                  const PCourseTile(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///Featured videos
                  PSectionHeading(
                    title: translatedStrings?[41] ?? 'Featured Videos',
                    textColor: dark ? Colors.white : Colors.black,
                    onPressed: () =>
                        Get.to(() =>
                            const PViewAllScreen(
                              initiativeType: 'Videos',
                            )),
                  ),
                  SizedBox(
                    height: 265,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return const PVideoCard();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///Latest Articles
                  PSectionHeading(
                    title: translatedStrings?[42] ?? 'Latest Articles',
                    textColor: dark ? Colors.white : Colors.black,
                    onPressed: () =>
                        Get.to(() =>
                        const PViewAllScreen(
                          initiativeType: 'Articles',
                        )),
                  ),
                  SizedBox(
                    height: 390,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return const PHomeArticleColumn();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:solution_challenge/common/widgets/education/articles/home_article_column.dart';
import 'package:solution_challenge/common/widgets/education/videos/video_card.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/texts/section_heading.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

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
                  ///Quiz Question
                  const PRoundedContainer(
                    height: 200,
                    backgroundColor: TColors.rani,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///Featured videos
                  PSectionHeading(
                    title: 'Featured Videos',
                    textColor: dark ? Colors.white : Colors.black,
                  ),
                  SizedBox(
                    height: 250,
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
                    title: 'Latest Articles',
                    textColor: dark ? Colors.white : Colors.black,
                  ),
                  SizedBox(
                    height: 365,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return const PHomeArticleColumn();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
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

class PEducationAppbar extends StatelessWidget {
  const PEducationAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hey Beautiful,",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.rani)),
          Text("Username",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: TColors.rani)),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.category,
              color: TColors.rani,
            ))
      ],
    );
  }
}

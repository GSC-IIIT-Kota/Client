import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PArticleScreen extends StatelessWidget {
  const PArticleScreen({
    super.key,
    required this.articleImg,
    required this.articleCategory,
    required this.readingTime,
    required this.uploadTime,
    required this.articleTitle,
    required this.hasAuthor,
    required this.articleAuthor,
    required this.articleContent,
  });

  final String articleImg;
  final String articleCategory;
  final String readingTime;
  final String uploadTime;
  final String articleTitle;
  final bool hasAuthor;
  final String articleAuthor;
  final String articleContent;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        backArrowColor: dark ? Colors.white : TColors.dimgrey,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Column(
            children: [
              ///Image of article
              PRoundedImage(imageUrl: articleImg),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Category
                    PCardIconText(
                        iconData: Iconsax.category,
                        iconColor: TColors.rani,
                        iconSize: 14,
                        title: articleCategory,
                        titleStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.rani)),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Reading time and posted when
                    Row(
                      children: [
                        ///Reading Time
                        PCardIconText(
                          iconData: Iconsax.clock,
                          iconSize: 14,
                          iconColor: TColors.battleship,
                          title: readingTime,
                          titleStyle: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.battleship),
                        ),

                        const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                        Text('~ $uploadTime',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.battleship)),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Title
                    Text(
                      articleTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Author Name
                    if (hasAuthor)
                      PRoundedContainer(
                        borderColor: TColors.rani,
                        backgroundColor: TColors.rani,
                        child: PCardIconText(
                          iconData: Iconsax.user,
                          title: articleAuthor,
                          titleStyle: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.white),
                        ),
                      ),

                    ///Content
                    Text(
                      articleContent,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark
                                ? Colors.white.withOpacity(0.8)
                                : TColors.dimgrey,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

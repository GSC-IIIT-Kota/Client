import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/models/education/articles.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PArticleScreen extends StatelessWidget {
  const PArticleScreen({
    super.key,
    required this.article,
  });

  final Article article;

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
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: Column(
            children: [
              ///Image of article
              PRoundedImage(
                  isNetworkImage: true, imageUrl: article.thumbnailUrl),

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
                        title: article.title,
                        titleStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.rani)),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Reading time and posted when
                    /// Saatvik: Fix this
                    // Row(
                    //   children: [
                    //     ///Reading Time
                    //     PCardIconText(
                    //       iconData: Iconsax.clock,
                    //       iconSize: 14,
                    //       iconColor: TColors.battleship,
                    //       title: "Est. 5 minutes.",
                    //       titleStyle: Theme.of(context)
                    //           .textTheme
                    //           .labelLarge!
                    //           .apply(color: TColors.battleship),
                    //     ),
                    //
                    //     const SizedBox(
                    //       width: TSizes.spaceBtwItems,
                    //     ),
                    //     Text(article.uploadDate.toIso8601String(),
                    //         style: Theme.of(context)
                    //             .textTheme
                    //             .labelLarge!
                    //             .apply(color: TColors.battleship)),
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: TSizes.spaceBtwItems,
                    // ),

                    ///Title
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Author Name
                    PRoundedContainer(
                      borderColor: TColors.rani,
                      backgroundColor: TColors.rani,
                      child: PCardIconText(
                        iconData: Iconsax.user,
                        title: article.authorName,
                        titleStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Content
                    Text(
                      article.content,
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

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
import '../../../../utils/datetime/date_time.dart';

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.star),
            color: TColors.brightpink,
          ),
        ],
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
                    ///Title
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),

                    ///Author Name
                    IntrinsicWidth(
                      child: PRoundedContainer(
                        radius: 100,
                        borderColor: TColors.rani,
                        backgroundColor: TColors.rani,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: TSizes.sm / 2, horizontal: TSizes.md),
                          child: PCardIconText(
                            iconData: Iconsax.user,
                            iconSize: 18,
                            iconColor: Colors.white,
                            title: article.authorName,
                            titleStyle: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Category
                    PCardIconText(
                        iconData: Iconsax.category,
                        iconColor: dark ? TColors.brightpink : TColors.rani,
                        iconSize: 14,
                        title: article.title,
                        titleStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: dark ? TColors.brightpink : TColors.rani)),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    Text(
                      '~ ${calculateTimeSince(article.uploadDate.toString())}',
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: TColors.battleship,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

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

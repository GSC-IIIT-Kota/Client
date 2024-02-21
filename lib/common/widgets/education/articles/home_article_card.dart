import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

import 'article_display.dart';

class PHomeArticleCard extends StatelessWidget {
  const PHomeArticleCard(
      {super.key,
      required this.articleImg,
      required this.articleCategory,
      required this.readingTime,
      required this.uploadTime,
      required this.articleTitle,
      required this.hasAuthor,
      required this.articleAuthor,
      required this.articleContent});

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
    return GestureDetector(
      onTap: () => Get.to(() => PArticleScreen(
          articleImg: articleImg,
          articleCategory: articleCategory,
          readingTime: readingTime,
          uploadTime: uploadTime,
          articleTitle: articleTitle,
          hasAuthor: hasAuthor,
          articleAuthor: articleAuthor,
          articleContent: articleContent)),
      child: Container(
        width: 300,
        height: 110,
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? Colors.black : Colors.white,
        ),
        child: Row(
          children: [
             const PRoundedContainer(
              backgroundColor: TColors.accent,
              child: PRoundedImage(
                imageUrl: TImages.banner4Image,
                aspectRatio: 1 / 1,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                // Adjust the padding as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      articleTitle,
                      style: Theme.of(context).textTheme.bodySmall!.apply(
                            color: dark ? Colors.white : TColors.dimgrey,
                            fontWeightDelta: 1,
                          ),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),

                    /// Icon with category
                    PCardIconText(
                        iconData: Iconsax.category,
                        iconColor: dark ? TColors.brightpink : TColors.rani,
                        iconSize: 14,
                        title: articleCategory,
                        titleStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: dark ? TColors.brightpink : TColors.rani)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

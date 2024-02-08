import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class PHomeArticleCard extends StatelessWidget {
  const PHomeArticleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 300,
        height: 100,
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const PRoundedContainer(
              backgroundColor: TColors.accent,
              child: PRoundedImage(
                imageUrl: TImages.articleThumbnail,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Downside of using reusable pads during menstrual cycles',
                      style: Theme.of(context).textTheme.bodySmall!.apply(
                            color: TColors.dimgrey,
                            fontWeightDelta: 1,
                          ),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),

                    /// Icon with category
                    PCardIconText(
                        iconData: Iconsax.category,
                        iconColor: TColors.rani,
                        iconSize: 14,
                        title: 'Menstrual Hygiene',
                        titleStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.rani)),
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

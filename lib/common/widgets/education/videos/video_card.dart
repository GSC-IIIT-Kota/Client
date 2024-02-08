import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class PVideoCard extends StatelessWidget {
  const PVideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: Colors.white,
        ),
        child: Column(
          children: [
            PRoundedContainer(
              backgroundColor: Colors.white,
              child: Stack(
                children: [
                  ///Thumbnail
                  const PRoundedImage(
                    isNetworkImage: true,
                    imageUrl:
                        'https://m.media-amazon.com/images/I/61Nyx0mNNwL.jpg',
                    applyImageRadius: true,
                    aspectRatio: 16 / 9,
                  ),

                  /// Play icon
                  Center(
                    heightFactor: 2,
                    child: Container(
                      width: 60, // Adjust the size as needed
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: TColors.brightpink
                            .withOpacity(0.8), // You can change the color
                      ),
                      child: const Icon(
                        Iconsax.play5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            ///VideoBody
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: Column(
                children: [
                  ///Video Title
                  Text(
                    'Downside of using reusable pads during menstrual cycles',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(color: TColors.dimgrey, fontWeightDelta: 1),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),

                  ///Video Category, Upload time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PCardIconText(
                            iconData: Iconsax.category,
                            iconSize: 14,
                            iconColor: TColors.rani,
                            title: 'Impact on Daily Life',
                            titleStyle: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.rani),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems / 2,
                          ),
                          PCardIconText(
                              iconData: Iconsax.clock,
                              iconSize: 14,
                              iconColor: TColors.dimgrey,
                              title: '2 days ago',
                              titleStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(color: TColors.dimgrey))
                        ],
                      ),
                      const Icon(Iconsax.star, size: 25, color: TColors.rani,),
                    ],
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
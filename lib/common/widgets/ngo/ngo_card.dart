import 'package:flutter/material.dart';
import 'package:solution_challenge/common/styles/card_shadow.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/icons/circular_heart.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/ngo/progress_bar.dart';
import 'package:solution_challenge/common/widgets/texts/campaign_card_desc.dart';
import 'package:solution_challenge/common/widgets/texts/campaign_card_title.dart';
import 'package:solution_challenge/common/widgets/texts/progress_text.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PNgoCard extends StatelessWidget {
  const PNgoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    double progressValue = 0.75;
    int raisedMoney = 2000;

    return Container(
      width: 300,
      padding: const EdgeInsets.all(1),
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        boxShadow: [PShadowStyle.cardShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.primaryBackground : Colors.white,
      ),
      child: Column(
        children: [
          ///Thumbnail, save button
          PRoundedContainer(
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : Colors.white,
            child: const Stack(
              children: [
                ///Thumbnail
                PRoundedImage(
                  imageUrl: TImages.banner1Image,
                  applyImageRadius: true,
                ),

                /// Favorite icon button
                Positioned(top: 0, right: 0, child: PCircularHeart()),
              ],
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems / 2,
          ),

          /// Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),

            /// Title, Description, Progress bar and raised amt details
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                const PCampaignCardTitle(
                  title: "Help these kids get money to study",
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),

                /// Description
                const PCampaignCardDesc(
                  desc:
                      "This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids.",
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),

                /// Progress bar
                PProgressBar(progressValue: progressValue),
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),

                /// Raised Money, Percentage
                PProgressText(raisedMoney: raisedMoney, progressValue: progressValue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


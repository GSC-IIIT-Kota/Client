import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/icons/circular_heart.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/ngo/campaign_profile.dart';
import 'package:solution_challenge/common/widgets/ngo/progress_bar.dart';
import 'package:solution_challenge/common/widgets/texts/campaign_card_title.dart';
import 'package:solution_challenge/common/widgets/texts/progress_text.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class PCampaignCard extends StatelessWidget {
  const PCampaignCard({
    super.key,
    required this.title,
    required this.description,
    required this.raisedMoney,
    required this.totalGoal,
    required this.imageUrl,
    required this.orgPhoto,
    required this.cardWidth,
    this.rightMargin = const EdgeInsets.only(right: 20),
  });

  final double cardWidth;
  final EdgeInsets? rightMargin;
  final String title;
  final String description;
  final int raisedMoney;
  final int totalGoal;
  final String imageUrl;
  final String orgPhoto;
  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    final double progressValue = totalGoal != 0 ? raisedMoney / totalGoal : 0;

    return GestureDetector(
      onTap: () => Get.to(() => PCampaignProfile(
        title: title,
        description: description,
        progressValue: progressValue,
        raisedMoney: raisedMoney,
        totalGoal: totalGoal,
        imageUrl: imageUrl,
        orgPhoto: orgPhoto,
        ngoName: 'NGO for Women',
        ngoLocation: 'Rajasthan, India',
      )),
      child: Container(
        width: cardWidth,
        padding: const EdgeInsets.all(1),
        margin: rightMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? Colors.black : Colors.white,
        ),
        child: Column(
          children: [
            ///Thumbnail, save button
            PRoundedContainer(
              backgroundColor: dark ? Colors.black : Colors.white,
              child:  Stack(
                children: [
                  ///Thumbnail
                  PRoundedImage(
                    imageUrl: imageUrl,
                    applyImageRadius: true,
                  ),

                  /// Favorite icon button
                  const Positioned(top: 5, right: 5, child: PCircularHeart()),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            /// Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),

              /// Title, Description, Progress bar and raised amt details
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  PCampaignCardTitle(
                    title: title,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),

                  ///Organization
                  PCardIconText(
                    iconData: Iconsax.verify5,
                    iconSize: 18,
                    iconColor: TColors.rani,
                    title: 'NGO for women',
                    titleStyle: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.battleship, fontWeightDelta: 2),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  PCardIconText(
                    iconData: Iconsax.clock,
                    iconSize: 18,
                    iconColor: TColors.rani,
                    title: '10 days left',
                    titleStyle: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.battleship, fontWeightDelta: 2),
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Progress bar
                  PProgressBar(
                    progressValue: progressValue,
                    backgroundColor: TColors.accent,
                    progressColor: TColors.rani,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),

                  /// Raised Money, Percentage
                  PCardProgressText(
                    raisedMoney: raisedMoney,
                    totalGoal: totalGoal,
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


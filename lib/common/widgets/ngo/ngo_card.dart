import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/icons/circular_heart.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/ngo/ngo_profile.dart';
import 'package:solution_challenge/common/widgets/ngo/progress_bar.dart';
import 'package:solution_challenge/common/widgets/texts/campaign_card_desc.dart';
import 'package:solution_challenge/common/widgets/texts/campaign_card_title.dart';
import 'package:solution_challenge/common/widgets/texts/progress_text.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class PNgoCard extends StatelessWidget {
  const PNgoCard({
    super.key,
    required this.title,
    required this.description,
    required this.raisedMoney,
    required this.totalGoal,
    this.imageUrl,
  });

  final String title;
  final String description;
  final int raisedMoney;
  final int totalGoal;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final double progressValue = raisedMoney / totalGoal;

    return GestureDetector(
      onTap: () => Get.to(() => PNgoProfile(
            title: title,
            description: description,
            progressValue: progressValue,
            raisedMoney: raisedMoney,
            totalGoal: totalGoal,
            imageUrl: TImages.banner1Image,
            orgPhoto:
                'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
          )),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? Colors.black : Colors.white,
        ),
        child: Column(
          children: [
            ///Thumbnail, save button
            PRoundedContainer(
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? Colors.black : Colors.white,
              child: const Stack(
                children: [
                  ///Thumbnail
                  PRoundedImage(
                    imageUrl: TImages.banner1Image,
                    applyImageRadius: true,
                  ),

                  /// Favorite icon button
                  Positioned(top: 5, right: 5, child: PCircularHeart()),
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
                  PCampaignCardTitle(
                    title: title,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),

                  /// Description
                  PCampaignCardDesc(
                    desc: description,
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
                  PCardProgressText(
                      raisedMoney: raisedMoney, totalGoal: totalGoal),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

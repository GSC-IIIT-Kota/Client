import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/ngo/campaign_profile.dart';
import 'package:solution_challenge/common/widgets/ngo/progress_bar.dart';
import 'package:solution_challenge/common/widgets/texts/campaign_card_title.dart';
import 'package:solution_challenge/common/widgets/texts/progress_text.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/models/campaign.dart';
import 'package:solution_challenge/services/ngo_service.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

import '../../../models/organisation.dart';

class PCampaignCard extends StatelessWidget {
  const PCampaignCard({
    super.key,
    required this.cardWidth,
    this.rightMargin = const EdgeInsets.only(right: 20),
    required this.campaign,
  });

  final double cardWidth;
  final EdgeInsets? rightMargin;
  final Campaign campaign;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    final double progressValue =
        campaign.totalGoal != 0 ? campaign.raisedMoney / campaign.totalGoal : 0;
    String id = "";
    id = campaign.ngoID;
    return FutureBuilder<NGO>(
      future: NGOService().getNGOById(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show loading indicator while fetching data
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        NGO? ngo = snapshot.data;

        return GestureDetector(
          onTap: () =>
              Get.to(() => PCampaignProfile(campaign: campaign, ngo: ngo)),
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
                PRoundedContainer(
                  backgroundColor: dark ? Colors.black : Colors.white,
                  child: PRoundedImage(
                    isNetworkImage: true,
                    imageUrl: campaign.imageUrl,
                    applyImageRadius: true,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Padding(
                  padding: const EdgeInsets.only(
                      left: TSizes.md,
                      right: TSizes.md,
                      bottom: TSizes.md,
                      top: TSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PCampaignCardTitle(title: campaign.title),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      PCardIconText(
                        iconData: Iconsax.verify,
                        iconSize: 18,
                        iconColor: dark ? TColors.brightpink : TColors.rani,
                        title: ngo!.profile!.ngoName,
                        titleStyle:
                            Theme.of(context).textTheme.labelLarge!.apply(
                                  color: dark
                                      ? Colors.white.withOpacity(0.8)
                                      : TColors.battleship,
                                  fontWeightDelta: 2,
                                ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      PCardIconText(
                        iconData: Iconsax.clock,
                        iconSize: 18,
                        iconColor: dark ? TColors.brightpink : TColors.rani,
                        title: '10 days left',
                        titleStyle:
                            Theme.of(context).textTheme.labelLarge!.apply(
                                  color: dark
                                      ? Colors.white.withOpacity(0.8)
                                      : TColors.battleship,
                                  fontWeightDelta: 2,
                                ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      PProgressBar(
                        progressValue: progressValue,
                        backgroundColor: TColors.accent,
                        progressColor: TColors.rani,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      PCardProgressText(
                        raisedMoney: campaign.raisedMoney.toInt(),
                        totalGoal: campaign.totalGoal.toInt(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:solution_challenge/common/widgets/ngo/campaign_card.dart';
import 'package:solution_challenge/common/widgets/ngo/event_card.dart';
import 'package:solution_challenge/common/widgets/ngo/organization_card.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PNgoViewAllScreen extends StatelessWidget {
  const PNgoViewAllScreen({super.key, required this.initiativeType});

  final String initiativeType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PPrimaryNgoContainer(
              child: Column(
                children: [
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Appbar
                  PAppBar(
                    showBackArrow: true,
                    title: Text(
                      initiativeType,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  PSearchContainer(
                    text: 'Search $initiativeType',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2,
                  ),
                ],
              ),
            ),

            ///Body
            if (initiativeType == 'Campaigns')
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Column(
                  children: [
                    PCampaignCard(
                      title: "Help these kids get money to study",
                      description:
                          "This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids.",
                      raisedMoney: 2000,
                      totalGoal: 4000,
                      imageUrl: TImages.banner1Image,
                      orgPhoto:
                          'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                      cardWidth: THelperFunctions.screenWidth(),
                      rightMargin: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    PCampaignCard(
                      title: "Help these kids get money to study",
                      description:
                          "This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids.",
                      raisedMoney: 2000,
                      totalGoal: 4000,
                      imageUrl: TImages.banner1Image,
                      orgPhoto:
                          'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                      cardWidth: THelperFunctions.screenWidth(),
                      rightMargin: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                  ],
                ),
              ),

            if (initiativeType == 'Events')
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Column(
                  children: [
                    PEventCard(
                      eventDate: '26th February, 2024',
                      eventDayTime: 'Wednesday 9AM',
                      eventTitle: 'Buy me pad, donation event annual for women',
                      eventLocation: 'St. Petersberg College',
                      eventDesc:
                          'Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum',
                      eventPhoto: TImages.banner2Image,
                      cardWidth: THelperFunctions.screenWidth(),
                      rightMargin: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    PEventCard(
                      eventDate: '26th February, 2024',
                      eventDayTime: 'Wednesday 9AM',
                      eventTitle: 'Buy me pad, donation event annual for women',
                      eventLocation: 'St. Petersberg College',
                      eventDesc:
                          'Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum',
                      eventPhoto: TImages.banner2Image,
                      cardWidth: THelperFunctions.screenWidth(),
                      rightMargin: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                  ],
                ),
              ),

            if (initiativeType == 'Organizations')
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Column(
                  children: [
                    POrganizationCard(
                        cardWidth: THelperFunctions.screenWidth(),
                        orgPhoto:
                            'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                        ngoName: 'NGO for Women',
                        ngoLocation: 'Rajasthan, India'),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    POrganizationCard(
                        cardWidth: THelperFunctions.screenWidth(),
                        orgPhoto:
                            'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                        ngoName: 'NGO for Women',
                        ngoLocation: 'Rajasthan, India'),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
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

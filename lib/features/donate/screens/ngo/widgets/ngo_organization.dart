import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/appbar/tabbar.dart';
import 'package:solution_challenge/common/widgets/icons/circular_heart.dart';
import 'package:solution_challenge/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:solution_challenge/common/widgets/ngo/campaign_card.dart';
import 'package:solution_challenge/common/widgets/ngo/event_card.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class POrganizationScreen extends StatelessWidget {
  const POrganizationScreen(
      {super.key,
      required this.orgPhoto,
      required this.ngoName,
      required this.ngoLocation});

  final String orgPhoto;
  final String ngoName;
  final String ngoLocation;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PAppBar(
          title: Text(
            'Organiser',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: const [
            PCircularHeart(),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? Colors.black : TColors.satin,
                expandedHeight: 160,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      PUserProfileTile(
                        imageUrl: orgPhoto,
                        title: ngoName,
                        subTitle: ngoLocation,
                        textColor: Colors.black,
                      )
                    ],
                  ),
                ),
                bottom: const PTabBar(
                  tabs: [
                    Tab(
                      child: Text('Campaigns'),
                    ),
                    Tab(
                      child: Text('Events'),
                    )
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(TSizes.defaultSpace),
                      child: Column(
                        children: [
                          PCampaignCard(
                            cardWidth: THelperFunctions.screenWidth(),
                            rightMargin: EdgeInsets.zero,
                            title: "Help these kids get money to study",
                            description:
                                "This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids.",
                            raisedMoney: 2000,
                            totalGoal: 4000,
                            imageUrl: TImages.banner1Image,
                            orgPhoto:
                                'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwSections,
                          ),
                          PCampaignCard(
                            cardWidth: THelperFunctions.screenWidth(),
                            rightMargin: EdgeInsets.zero,
                            title: "Help these kids get money to study",
                            description:
                                "This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids.",
                            raisedMoney: 2000,
                            totalGoal: 4000,
                            imageUrl: TImages.banner1Image,
                            orgPhoto:
                                'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                          ),
                        ],
                      ),
                    ),
                  ]),
              ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(TSizes.defaultSpace),
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
                        ],
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}

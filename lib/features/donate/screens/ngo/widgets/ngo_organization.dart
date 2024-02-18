import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/appbar/tabbar.dart';
import 'package:solution_challenge/common/widgets/icons/circular_heart.dart';
import 'package:solution_challenge/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:solution_challenge/common/widgets/ngo/campaign_card.dart';
import 'package:solution_challenge/common/widgets/ngo/event_card.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import '../../../../../models/event.dart';

class POrganizationScreen extends StatelessWidget {
  const POrganizationScreen({
    Key? key,
    required this.orgPhoto,
    required this.ngoName,
    required this.ngoLocation,
    required this.events, // Add events parameter
  }) : super(key: key);

  final String orgPhoto;
  final String ngoName;
  final String ngoLocation;
  final List<Event> events; // Define events parameter

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PAppBar(
          title: Text(
            translatedStrings?[36] ?? 'Organiser',
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
                bottom: PTabBar(
                  tabs: [
                    Tab(
                      child: Text(translatedStrings?[37] ?? 'Campaigns'),
                    ),
                    Tab(
                      child: Text(translatedStrings?[38] ?? 'Events'),
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
                  for (var event in events)
                    Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: PCampaignCard(
                        cardWidth: PHelperFunctions.screenWidth(),
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
                    ),
                ],
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (var event in events)
                    Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: PEventCard(
                        eventDate: event.date,
                        eventDayTime: event.time,
                        eventTitle: event.title,
                        eventLocation: event.location,
                        eventDesc: event.description,
                        eventPhoto: event.banner,
                        cardWidth: PHelperFunctions.screenWidth(),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


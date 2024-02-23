import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/appbar/tabbar.dart';
import 'package:solution_challenge/common/widgets/icons/circular_heart.dart';
import 'package:solution_challenge/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:solution_challenge/common/widgets/ngo/campaign_card.dart';
import 'package:solution_challenge/common/widgets/ngo/event_card.dart';
import 'package:solution_challenge/services/campaign_service.dart';
import 'package:solution_challenge/services/event_service.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';

import '../../../../../models/campaign.dart';
import '../../../../../models/event.dart';

class POrganizationScreen extends StatelessWidget {
  const POrganizationScreen({
    super.key,
    required this.orgPhoto,
    required this.ngoName,
    required this.ngoLocation,
    required this.events,
    required this.campaigns,
  });

  final String orgPhoto;
  final String ngoName;
  final String ngoLocation;
  final List<String> events;
  final List<String> campaigns;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PAppBar(
          title: Text(
            translatedStrings?[36] ?? 'Organiser',
            style: Theme.of(context).textTheme.headlineMedium!,
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
                        textColor: Colors.black, showSubtitle: true,
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
                  for (var campaignId in campaigns)
                    FutureBuilder<Campaign?>(
                      future: CampaignService().getCampaignById(campaignId),
                      // Assuming getCampaignById is a function to fetch campaign details by ID
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.data == null) {
                          return const Text('Campaign not found');
                        } else {
                          final campaign = snapshot.data!;
                          return Padding(
                            padding: const EdgeInsets.all(TSizes.defaultSpace),
                            child: PCampaignCard(
                              cardWidth: PHelperFunctions.screenWidth(),
                              rightMargin: EdgeInsets.zero,
                              title: campaign.title,
                              description: campaign.description,
                              raisedMoney: campaign.raisedMoney,
                              totalGoal: campaign.totalGoal,
                              imageUrl: campaign.imageUrl,
                              orgPhoto: orgPhoto,
                            ),
                          );
                        }
                      },
                    ),
                ],
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (var eventId in events)
                    FutureBuilder<Event>(
                      future: EventService().getEventById(eventId),
                      // Assuming getEventById is a function to fetch event details by ID
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.data == null) {
                          return const Text('Event not found');
                        } else {
                          final event = snapshot.data!;
                          return Padding(
                            padding: const EdgeInsets.all(TSizes.defaultSpace),
                            child: PEventCard(
                              eventDate: "${event.uploadDate}",
                              // Assuming 'date' is the correct key in your Event model
                              eventTitle: event.title,
                              eventLocation: event.location,
                              eventDesc: event.description,
                              eventPhoto: event.banner,
                              cardWidth: PHelperFunctions.screenWidth(), eventDayTime: 'Wednesday, 9 AM',
                            ),
                          );
                        }
                      },
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

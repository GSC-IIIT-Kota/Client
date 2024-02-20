import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/ngo/campaign_card.dart';
import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
import 'package:solution_challenge/common/widgets/viewall/viewall_cards.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import '../../../../models/campaign.dart';
import '../../../../services/campaign_service.dart';

class PCampaignSection extends StatelessWidget {
  const PCampaignSection({
    super.key,
    required this.sectionHeading,
    required this.initiativeType,
    required this.cardHeight,
  });

  final String sectionHeading;
  final String initiativeType;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        PSectionHeading(
          title: sectionHeading,
          textColor: dark ? Colors.white : Colors.black,
          onPressed: () =>
              Get.to(() =>
                  PViewAllScreen(
                    initiativeType: initiativeType,
                  )),
        ),
        FutureBuilder<List<Campaign>>(
          future: CampaignService.getAllCampaigns(),
          builder: (context, AsyncSnapshot<List<Campaign>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final List<Campaign> campaigns = snapshot.data ?? [];
              return SizedBox(
                height: cardHeight,
                child: ListView.builder(
                  itemCount: campaigns.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return PCampaignCard(
                      cardWidth: 250,
                      title: campaigns[index].title,
                      description: campaigns[index].description,
                      raisedMoney: campaigns[index].raisedMoney,
                      totalGoal: campaigns[index].totalGoal,
                      imageUrl: campaigns[index].imageUrl,
                      orgPhoto: campaigns[index].ngoID, // Assuming this is the organization's photo URL
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/ngo/campaign_card.dart';
import 'package:solution_challenge/common/widgets/ngo/organization_card.dart';
import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
import 'package:solution_challenge/features/donate/screens/ngo/widgets/ngo_viewall.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/ngo/event_card.dart';

class POrganisationSection extends StatelessWidget {
  const POrganisationSection({
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
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        PSectionHeading(
          title: sectionHeading,
          textColor: dark ? Colors.white : Colors.black,
          onPressed: () => Get.to(() => PNgoViewAllScreen(
            initiativeType: initiativeType,
          )),
        ),
        SizedBox(
          height: cardHeight,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              if (initiativeType == 'Organizations') {
                return const POrganizationCard(
                    cardWidth: 250,
                    orgPhoto:
                    'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                    ngoName: 'NGO for Women',
                    ngoLocation: 'Rajasthan, India');
              }
              else {
                // Return a default widget or null if initiativeType is none of the above
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}

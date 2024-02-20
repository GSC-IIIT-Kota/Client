import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/common/widgets/ngo/organization_card.dart';
import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
import 'package:solution_challenge/common/widgets/viewall/viewall_cards.dart';
import 'package:solution_challenge/models/organisation.dart';
import 'package:solution_challenge/services/ngo_service.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

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
    final dark = PHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        PSectionHeading(
          title: sectionHeading,
          textColor: dark ? Colors.white : Colors.black,
          onPressed: () => Get.to(() => PViewAllScreen(
            initiativeType: initiativeType,
          )),
        ),
        FutureBuilder<List<NGO>?>(
          future: NGOService().getAllNGOs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final List<NGO> ngos = snapshot.data ?? [];
              return SizedBox(
                height: cardHeight,
                child: ListView.builder(
                  itemCount: ngos.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final organization = ngos[index];
                    return POrganizationCard(
                      cardWidth: 250,
                      orgPhoto: organization.profile?.logo ?? '',
                      ngoName: organization.profile?.ngoName ?? '',
                      ngoLocation:
                      '${organization.profile?.city ?? ''}, ${organization.profile?.country ?? ''}',
                      id: organization.id,
                      email: organization.email,
                      passwordHash: organization.passwordHash,
                      campaigns: organization.campaigns ?? [],
                      events: organization.events ?? [],
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

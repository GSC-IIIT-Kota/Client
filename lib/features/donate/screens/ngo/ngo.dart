import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:solution_challenge/features/donate/screens/ngo/widgets/ngo_appbar.dart';
import 'package:solution_challenge/features/donate/screens/ngo/widgets/ngo_categories.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

import '../../../../common/widgets/ngo/sections/CampaignSection.dart';
import '../../../../common/widgets/ngo/sections/EventSection.dart';
import '../../../../common/widgets/ngo/sections/OrganistionSection.dart';

class NgoScreen extends StatelessWidget {
  const NgoScreen({super.key});

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
                  const PNgoAppBar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// SearchBar
                  PSearchContainer(
                    text: translatedStrings?[39] ?? "Search Organizations",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Categories
                  const PNgoCategories(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            /// Body
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  PCampaignSection(
                    sectionHeading: 'New Campaigns',
                    initiativeType: 'Campaigns',
                    cardHeight: 270,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  POrganisationSection(
                    sectionHeading: 'Organizations',
                    initiativeType: 'Organizations',
                    cardHeight: 90,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  PEventSection(
                    sectionHeading: 'Upcoming Events',
                    initiativeType: 'Events',
                    cardHeight: 210,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

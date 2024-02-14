import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:solution_challenge/features/donate/screens/ngo/widgets/ngo_appbar.dart';
import 'package:solution_challenge/features/donate/screens/ngo/widgets/ngo_categories.dart';
import 'package:solution_challenge/features/donate/screens/ngo/widgets/ngo_section.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class NgoScreen extends StatelessWidget {
  const NgoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PPrimaryNgoContainer(
              child: Column(
                children: [
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Appbar
                  PNgoAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// SearchBar
                  PSearchContainer(
                    text: "Search Organizations",
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Categories
                  PNgoCategories(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  PNgoSection(
                    sectionHeading: 'Top Fundraisers',
                    initiativeType: 'Campaigns', cardHeight: 270,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  PNgoSection(
                    sectionHeading: 'New Campaigns',
                    initiativeType: 'Orgs', cardHeight: 200,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  PNgoSection(
                    sectionHeading: 'Upcoming Events',
                    initiativeType: 'Events', cardHeight: 230,
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

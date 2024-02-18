import 'package:flutter/material.dart';
import 'package:solution_challenge/features/donate/screens/ngo/widgets/ngo_organization.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';


class POrganizationCard extends StatelessWidget {
  const POrganizationCard({
    super.key,
    required this.cardWidth,
    required this.orgPhoto,
    required this.ngoName,
    required this.ngoLocation,
    required this.id,
    required this.email,
    required this.passwordHash,
    required this.campaigns,
    required this.events,
  });

  final double cardWidth;
  final String orgPhoto;
  final String ngoName;
  final String ngoLocation;
  final String id;
  final String email;
  final String passwordHash;
  final List<String> campaigns;
  final List<String> events;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(
        () => POrganizationScreen(
          orgPhoto: orgPhoto,
          ngoName: ngoName,
          ngoLocation: ngoLocation,
          events: [],
        ),
      ),
      child: Container(
        width: cardWidth,
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? Colors.black : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.md, vertical: TSizes.md),

          /// Avatar, Org Name and location
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Avatar
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(orgPhoto),
              ),

              Padding(
                padding: const EdgeInsets.only(left: TSizes.spaceBtwItems),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ngoName,
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                          color: dark ? TColors.accent : TColors.dimgrey,
                          fontWeightDelta: 2),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      ngoLocation,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? TColors.accent : TColors.battleship),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

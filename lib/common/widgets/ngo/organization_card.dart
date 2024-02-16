import 'package:flutter/material.dart';
import 'package:solution_challenge/features/donate/screens/ngo/widgets/ngo_organization.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class POrganizationCard extends StatelessWidget {
  const POrganizationCard(
      {super.key,
      required this.cardWidth,
      this.rightMargin = const EdgeInsets.only(right: 20),
      required this.orgPhoto,
      required this.ngoName,
      required this.ngoLocation});

  final double cardWidth;
  final EdgeInsets rightMargin;
  final String orgPhoto;
  final String ngoName;
  final String ngoLocation;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(
        () => POrganizationScreen(orgPhoto: orgPhoto, ngoName: ngoName, ngoLocation: ngoLocation,),
      ),
      child: Container(
        width: cardWidth,
        padding: const EdgeInsets.all(1),
        margin: rightMargin,
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/features/donate/screens/ngo/widgets/ngo_organization.dart';
import 'package:solution_challenge/models/organisation.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class POrganizationCard extends StatelessWidget {
  const POrganizationCard({
    super.key,
    required this.cardWidth,
    required this.ngo,
  });

  final double cardWidth;
  final NGO ngo;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(
        () => POrganizationScreen(ngo: ngo),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///Avatar
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(ngo.profile!.logo),
              ),

              Padding(
                padding: const EdgeInsets.only(left: TSizes.spaceBtwItems),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ngo.profile!.ngoName,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: dark ? Colors.white : Colors.black,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      ngo.profile!.address,
                      style: Theme.of(context).textTheme.bodySmall!.apply(
                          color: dark
                              ? Colors.white.withOpacity(0.8)
                              : TColors.battleship),
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

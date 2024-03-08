import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/models/event.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

import '../../../utils/helpers/helper_functions.dart';
import './event_profile.dart';
import '../../../utils/datetime/date_time.dart';

class PEventCard extends StatelessWidget {
  const PEventCard({
    super.key,
    required this.cardWidth, required this.event, this.rightMargin = const EdgeInsets.only(right: 20),
  });
  final double cardWidth;
  final EdgeInsets? rightMargin;
  final Event event;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        // Handle onTap event
        Get.to(() => PEventProfile(
          event: event,
          cardWidth: cardWidth,
        ));
      },
      child: Container(
        width: cardWidth,
        padding: const EdgeInsets.all(1),
        margin: rightMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? Colors.black : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Iconsax.clock5,
                size: 30,
                color: dark ? TColors.brightpink : TColors.rani,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title ,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .apply(color: dark ? TColors.brightpink : TColors.rani),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      Text(
                        formatDateFromString(event.uploadDate.toString()),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: dark ? Colors.white.withOpacity(0.8) : Colors.black.withOpacity(0.8)),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      Text(
                        formatTimeString(event.uploadDate.toString()),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: dark ? Colors.white.withOpacity(0.8) : Colors.black.withOpacity(0.8)),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      PCardIconText(
                        iconData: Iconsax.location,
                        iconSize: 20,
                        iconColor: TColors.dimgrey,
                        title: event.location,
                        titleStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: dark ? Colors.white.withOpacity(0.8) : TColors.battleship),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      Text(
                        event.description,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: dark ? Colors.white.withOpacity(0.8) : TColors.battleship),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PEventCard extends StatelessWidget {
  const PEventCard(
      {super.key,
      required this.eventDate,
      required this.eventDayTime,
      required this.eventTitle, required this.eventLocation, required this.eventDesc});

  final String eventDate;
  final String eventDayTime;
  final String eventTitle;
  final String eventLocation;
  final String eventDesc;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.only(right: 20),
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
                const Icon(
                  Iconsax.clock5,
                  size: 30,
                  color: TColors.rani,
                ),

              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: TSizes.sm),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eventDate,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: Colors.black, fontWeightDelta: 1),
                        ),
                        const SizedBox(
                          height: TSizes.sm,
                        ),
                        Text(
                          eventDayTime,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: TColors.rani),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                        Text(
                          eventTitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: TColors.battleship, fontWeightDelta: 2),
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
                          title: eventLocation,
                          titleStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: TColors.battleship),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                        Text(
                          eventDesc,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: TColors.battleship),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
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

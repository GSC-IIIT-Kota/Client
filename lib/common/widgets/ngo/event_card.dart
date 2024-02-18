import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import './event_profile.dart';

class PEventCard extends StatelessWidget {
  const PEventCard({
    Key? key,
    required this.eventDate,
    required this.eventDayTime,
    required this.eventTitle,
    required this.eventLocation,
    required this.eventDesc,
    required this.eventPhoto,
    required this.cardWidth,
  }) : super(key: key);

  final String? eventDate;
  final String? eventDayTime;
  final String? eventTitle;
  final String? eventLocation;
  final String? eventDesc;
  final String? eventPhoto;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        // Handle onTap event
        Get.to(() => PEventProfile(
          eventDate: eventDate!,
          eventDayTime: eventDayTime!,
          eventTitle: eventTitle!,
          eventLocation: eventLocation!,
          eventDesc: eventDesc!,
          eventPhoto: eventPhoto!,
          cardWidth: cardWidth,
        ));
      },
      child: Container(
        width: cardWidth,
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.only(right: 8),
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
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eventDate ?? '',
                        style: Theme.of(context).textTheme.bodyText2!.apply(
                          color: Colors.black,
                          fontWeightDelta: 1,
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      Text(
                        eventDayTime ?? '',
                        style: Theme.of(context).textTheme.bodyText2!.apply(
                          color: TColors.rani,
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      Text(
                        eventTitle ?? '',
                        style: Theme.of(context).textTheme.bodyText2!.apply(
                          color: TColors.battleship,
                          fontWeightDelta: 2,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      Text(
                        eventLocation ?? '',
                        style: Theme.of(context).textTheme.bodyText2!.apply(
                          color: TColors.battleship,
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      Text(
                        eventDesc ?? '',
                        style: Theme.of(context).textTheme.bodyText2!.apply(
                          color: TColors.battleship,
                        ),
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

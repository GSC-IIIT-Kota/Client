import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/ngo/people_donating.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import '../appbar/appbar.dart';
import '../icons/circular_heart.dart';

class PEventProfile extends StatefulWidget {
  const PEventProfile({
    super.key,
    required this.eventDate,
    required this.eventDayTime,
    required this.eventTitle,
    required this.eventLocation,
    required this.eventDesc,
    required this.eventPhoto,
    required this.cardWidth,
  });

  final String eventDate;
  final String eventDayTime;
  final String eventTitle;
  final String eventLocation;
  final String eventDesc;
  final String eventPhoto;
  final double cardWidth;

  @override
  _PEventProfileState createState() => _PEventProfileState();
}

class _PEventProfileState extends State<PEventProfile> {

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        backArrowColor: dark ? Colors.white : TColors.dimgrey,
        actions: const [
          PCircularHeart(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Column(
            children: [
              PRoundedImage(imageUrl: widget.eventPhoto),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.eventTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    PCardIconText(
                      iconData: Iconsax.location,
                      iconColor: TColors.battleship,
                      title: widget.eventLocation,
                      titleStyle: Theme.of(context).textTheme.titleSmall!.apply(
                        color: dark ? Colors.white : TColors.battleship,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const PPeopleDonated(
                      userPhotos: [
                        'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                        'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                        'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                      ],
                      numberOfPeople: 120,
                      text: 'attending',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    PCardIconText(
                      iconData: Iconsax.calendar,
                      title: widget.eventDate,
                      titleStyle: Theme.of(context).textTheme.titleSmall!.apply(
                        color: dark ? Colors.white : Colors.black,
                        fontWeightDelta: 2,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    PCardIconText(
                      iconData: Iconsax.clock,
                      iconColor: TColors.rani,
                      title: widget.eventDayTime,
                      titleStyle: Theme.of(context).textTheme.titleSmall!.apply(
                        color: dark ? Colors.white : TColors.rani,
                        fontWeightDelta: 2,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Divider(
                      color: dark
                          ? TColors.battleship
                          : TColors.battleship.withOpacity(0.5),
                      thickness: 0.9,
                      indent: 5,
                      endIndent: 5,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                        color: dark ? TColors.brightpink : TColors.burgandy,
                        fontWeightDelta: 2,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Text(
                      widget.eventDesc,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark
                            ? Colors.white.withOpacity(0.8)
                            : TColors.dimgrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

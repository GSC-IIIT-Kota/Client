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

class PEventProfile extends StatelessWidget {
  const PEventProfile(
      {super.key,
      required this.eventTitle,
      required this.eventDate,
      required this.eventDayTime,
      required this.eventLocation,
      required this.eventDesc,
      required this.eventPhoto});

  final String eventDate;
  final String eventDayTime;
  final String eventTitle;
  final String eventLocation;
  final String eventDesc;
  final String eventPhoto;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const PAppBar(
        showBackArrow: true,
        actions: [
          PCircularHeart(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Column(
            children: [
              /// Image of the Event
              PRoundedImage(imageUrl: eventPhoto),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Event Title
                    Text(
                      eventTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    ///Event location
                    PCardIconText(
                      iconData: Iconsax.location,
                      iconColor: TColors.battleship,
                      title: eventLocation,
                      titleStyle: Theme.of(context).textTheme.titleSmall!.apply(
                          color: dark ? Colors.white : TColors.battleship,),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// People who are attending
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

                    ///Event date
                    PCardIconText(
                      iconData: Iconsax.calendar,
                      title: eventDate,
                      titleStyle: Theme.of(context).textTheme.titleSmall!.apply(
                          color: dark ? Colors.white : Colors.black,
                          fontWeightDelta: 2),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2,),

                    ///Event DayTime
                    PCardIconText(
                      iconData: Iconsax.clock,
                      iconColor: TColors.rani,
                      title: eventDayTime,
                      titleStyle: Theme.of(context).textTheme.titleSmall!.apply(
                          color: dark ? Colors.white : TColors.rani,
                          fontWeightDelta: 2),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems,),

                    /// Divider
                    Divider(
                      color: dark
                          ? TColors.battleship
                          : TColors.battleship.withOpacity(0.5),
                      thickness: 0.9,
                      indent: 5,
                      endIndent: 5,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    // Organiser details
                    Text(
                      "Organiser",
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                          color: dark ? Colors.white : Colors.black,
                          fontWeightDelta: 2),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    ListTile(
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg'),
                      ),
                      title: Text(
                        "NGO for women",
                        style: Theme.of(context).textTheme.titleSmall!.apply(
                            color: dark ? TColors.accent : TColors.dimgrey,
                            fontWeightDelta: 2),
                      ),
                      subtitle: Text(
                        "Rajasthan, India",
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark ? TColors.accent : TColors.battleship),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    // Description
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                          color: dark ? TColors.brightpink : TColors.burgandy,
                          fontWeightDelta: 2),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    Text(
                      eventTitle,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark
                              ? Colors.white.withOpacity(0.8)
                              : TColors.dimgrey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.lg, vertical: TSizes.md),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Register'),
        ),
      ),
    );
  }
}

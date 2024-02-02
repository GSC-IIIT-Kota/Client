import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/icons/circular_heart.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/ngo/people_donating.dart';
import 'package:solution_challenge/common/widgets/ngo/progress_bar.dart';
import 'package:solution_challenge/common/widgets/texts/progress_text.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PNgoProfile extends StatelessWidget {
  const PNgoProfile({
    Key? key,
    required this.title,
    required this.description,
    required this.progressValue,
    required this.raisedMoney,
    required this.totalGoal,
    required this.imageUrl,
    this.onDonatePressed,
    required this.orgPhoto,
  }) : super(key: key);

  final String title;
  final String description;
  final double progressValue;
  final int raisedMoney;
  final int totalGoal;
  final String imageUrl;
  final VoidCallback? onDonatePressed;
  final String orgPhoto;

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
              // Image of the campaign
              const PRoundedImage(imageUrl: TImages.banner1Image),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // People who donated
                    const PPeopleDonated(
                      userPhotos: [
                        'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                        'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                        'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                      ],
                      numberOfPeople: 120,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Progress bar
                    PProgressBar(progressValue: progressValue),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Raised Money, Total Goal, and Percentage
                    PProfileProgressText(
                        totalGoal: totalGoal, raisedMoney: raisedMoney),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    // Divider
                    Divider(
                      color: dark ? TColors.battleship : TColors.battleship.withOpacity(0.5),
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 5,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    // Organiser details
                    Text(
                      "Organiser",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: dark ? Colors.white : Colors.black, fontWeightDelta: 2),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(orgPhoto),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SizedBox(
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "NGO for women",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(
                                          color: dark ? TColors.accent : TColors.dimgrey,
                                          fontWeightDelta: 2),
                                ),
                                const SizedBox(
                                  height: TSizes.xs,
                                ),
                                Text(
                                  "Rajasthan, India",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(color: dark ? TColors.accent : TColors.battleship),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Description
                    Text(
                      "Description",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: dark ? TColors.brightpink : TColors.burgandy, fontWeightDelta: 2),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    Text(
                      description,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark ? Colors.white.withOpacity(0.8) : TColors.dimgrey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.lg, vertical: TSizes.md),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Donate now'),
        ),
      ),
    );
  }
}

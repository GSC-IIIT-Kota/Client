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

import 'description.dart';

class PCampaignProfile extends StatefulWidget {
  final String title;
  final String description;
  final double progressValue;
  final int raisedMoney;
  final int totalGoal;
  final String imageUrl;
  final String orgPhoto;

  const PCampaignProfile({
    Key? key,
    required this.title,
    required this.description,
    required this.progressValue,
    required this.raisedMoney,
    required this.totalGoal,
    required this.imageUrl,
    required this.orgPhoto,
  }) : super(key: key);

  @override
  _PCampaignProfileState createState() => _PCampaignProfileState();
}
class _PCampaignProfileState extends State<PCampaignProfile> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

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
              // Image of the campaign
              const PRoundedImage(imageUrl: TImages.banner1Image),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      widget.title,
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
                      text: 'donated',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Progress bar
                    PProgressBar(
                      progressValue: widget.progressValue,
                      backgroundColor: TColors.accent,
                      progressColor: TColors.rani,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Raised Money, Total Goal, and Percentage
                    PProfileProgressText(
                        totalGoal: widget.totalGoal,
                        raisedMoney: widget.raisedMoney),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    // Divider
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
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(widget.orgPhoto),
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
                    DescriptionWidget(
                      description: widget.description,
                      showFullDescription: showFullDescription,
                      onReadMorePressed: () {
                        setState(() {
                          showFullDescription = true;
                        });
                      },
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
          child: const Text('Donate now'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/ngo/payment.dart';
import 'package:solution_challenge/common/widgets/ngo/people_donating.dart';
import 'package:solution_challenge/common/widgets/ngo/progress_bar.dart';
import 'package:solution_challenge/common/widgets/texts/progress_text.dart';
import 'package:solution_challenge/features/donate/screens/ngo/widgets/ngo_organization.dart';
import 'package:solution_challenge/models/campaign.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

import '../../../models/organisation.dart';
import 'description.dart';

class PCampaignProfile extends StatefulWidget {
  final NGO ngo;
  final Campaign campaign;

  const PCampaignProfile({
    super.key,
    required this.campaign,
    required this.ngo,
  });

  @override
  _PCampaignProfileState createState() => _PCampaignProfileState();
}

class _PCampaignProfileState extends State<PCampaignProfile> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    final double progressValue = widget.campaign.totalGoal != 0
        ? widget.campaign.raisedMoney / widget.campaign.totalGoal
        : 0;

    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        backArrowColor: dark ? Colors.white : TColors.dimgrey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Column(
            children: [
              // Image of the campaign
              PRoundedImage(imageUrl: widget.campaign.imageUrl),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      widget.campaign.title,
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
                      progressValue: progressValue,
                      backgroundColor: TColors.accent,
                      progressColor: TColors.rani,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Raised Money, Total Goal, and Percentage
                    PCardProgressText(
                        raisedMoney: widget.campaign.raisedMoney.toInt(),
                        totalGoal: widget.campaign.totalGoal.toInt()),
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

                    GestureDetector(
                      onTap: () => Get.to(() => POrganizationScreen(
                            ngo: widget.ngo,
                          )),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              NetworkImage(widget.ngo.profile!.logo),
                        ),
                        title: Text(
                          widget.ngo.profile!.ngoName,
                          style: Theme.of(context).textTheme.titleSmall!.apply(
                              color: dark ? TColors.accent : TColors.dimgrey,
                              fontWeightDelta: 2),
                        ),
                        subtitle: Text(
                          widget.ngo.profile!.address,
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color:
                                  dark ? TColors.accent : TColors.battleship),
                        ),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    // Description
                    DescriptionWidget(
                      description: widget.campaign.description,
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
            horizontal: TSizes.defaultSpace, vertical: TSizes.md),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RazorPayPage()),
            );
          },
          child: const Text('Donate now'),
        ),
      ),
    );
  }
}

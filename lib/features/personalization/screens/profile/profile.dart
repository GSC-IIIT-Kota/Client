import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
import 'package:solution_challenge/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      ///AppBar
      appBar: const PAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      ///Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg"),
                      radius: 40,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text('Change profile picture',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(color: TColors.rani)))
                  ],
                ),
              ),

              ///Details
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Heading profile info
              PSectionHeading(
                title: 'Profile Information',
                textColor: dark ? Colors.white : Colors.black,
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              PProfileMenu(
                  onPressed: () {}, title: 'Name', value: 'Yogit Nainani'),
              PProfileMenu(
                  onPressed: () {}, title: 'Username', value: 'yogitnainani'),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Heading personal info
              PSectionHeading(
                title: 'Personal Information',
                textColor: dark ? Colors.white : Colors.black,
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              PProfileMenu(
                  onPressed: () {},
                  title: 'E-Mail',
                  value: 'yogitnainani@gmail.com'),
              PProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: '+91-4567456433'),
              PProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '10 Oct, 1994'),
            ],
          ),
        ),
      ),
    );
  }
}

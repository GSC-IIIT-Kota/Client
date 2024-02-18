import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
import 'package:solution_challenge/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
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
                        child: Text(translatedStrings?[47] ?? 'Change profile picture',
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
                title: translatedStrings?[48] ?? 'Profile Information',
                textColor: dark ? Colors.white : Colors.black,
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              PProfileMenu(
                  onPressed: () {}, title: translatedStrings?[49] ?? 'Name', value: 'Yogit Nainani'),
              PProfileMenu(
                  onPressed: () {}, title: translatedStrings?[25] ?? 'Username', value: 'yogitnainani'),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Heading personal info
              PSectionHeading(
                title: translatedStrings?[50] ?? 'Personal Information',
                textColor: dark ? Colors.white : Colors.black,
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              PProfileMenu(
                  onPressed: () {},
                  title: translatedStrings?[7] ?? 'E-Mail',
                  value: 'yogitnainani@gmail.com'),
              PProfileMenu(
                  onPressed: () {},
                  title: translatedStrings?[26] ?? 'Phone Number',
                  value: '+91-4567456433'),
              PProfileMenu(
                  onPressed: () {},
                  title: translatedStrings?[51] ?? 'Date of Birth',
                  value: '10 Oct, 1994'),
            ],
          ),
        ),
      ),
    );
  }
}

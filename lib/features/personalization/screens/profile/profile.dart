import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
import 'package:solution_challenge/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import '../../../../utils/userPrefernces/userProvider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
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
                    CircleAvatar(
                      backgroundImage: NetworkImage(user!.profile.profileImage),
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
                  onPressed: () {}, title: translatedStrings?[49] ?? 'Name', value: "${user.profile.firstName} ${user.profile.lastName}"),
              PProfileMenu(
                  onPressed: () {}, title: translatedStrings?[25] ?? 'Username', value: user.profile.firstName),

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
                  value: user.email),
              PProfileMenu(
                  onPressed: () {},
                  title: translatedStrings?[26] ?? 'Phone Number',
                  value: user.profile.phoneNumber),
              PProfileMenu(
                  onPressed: () {},
                  title: translatedStrings?[51] ?? 'Date of Birth',
                  value: user.profile.dob),
            ],
          ),
        ),
      ),
    );
  }
}

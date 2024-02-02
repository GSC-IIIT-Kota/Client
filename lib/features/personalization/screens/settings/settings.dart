import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:solution_challenge/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            PPrimaryNgoContainer(
              child: Column(
                children: [
                  ///AppBar
                  PAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: Colors.white),
                    ),
                  ),

                  ///User Profile
                  const PUserProfileTile(
                    subTitle: "testemail@gmail.com",
                    imageUrl:
                        "https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg",
                    title: "Yogit Nainani",
                    showEditIcon: true,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Account Settings
                  PSectionHeading(
                    title: 'Account Settings',
                    textColor: dark ? Colors.white : Colors.black,
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  const PSettingsMenuTile(
                    icon: Iconsax.book_saved,
                    title: "Bookmarked Resources",
                    subTitle: "Explore your saved educational treasures",
                  ),
                  const PSettingsMenuTile(
                      icon: Iconsax.receipt,
                      title: "My Donations",
                      subTitle: "Track your contributions"),
                  const PSettingsMenuTile(
                      icon: Iconsax.path,
                      title: "My Blogs",
                      subTitle: "Your experiences at one place"),
                  const PSettingsMenuTile(
                      icon: Iconsax.heart,
                      title: "Favorite Campaigns",
                      subTitle: "Stay connected to causes close to your heart"),
                  const PSettingsMenuTile(
                      icon: Iconsax.document_favorite,
                      title: "Saved Blogs",
                      subTitle: "Your favorite reads"),

                  ///App Settings
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  PSectionHeading(
                    title: 'App Settings',
                    textColor: dark ? Colors.white : Colors.black,
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const PSettingsMenuTile(
                      icon: Iconsax.language_circle,
                      title: "Change language",
                      subTitle: "Tailor your experience with a language switch")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

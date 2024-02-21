import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:solution_challenge/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import '../../../../utils/userPrefernces/userProvider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final userFirstName = user?.profile.firstName ?? "";
    // print(userFirstName);
    final dark = PHelperFunctions.isDarkMode(context);
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
                      translatedStrings?[52] ?? "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: Colors.white),
                    ),
                  ),

                  ///User Profile
                  PUserProfileTile(
                    subTitle: userFirstName,
                    imageUrl: user!.profile.profileImage,
                    title: "",
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
                    title: translatedStrings?[53] ?? 'Account Settings',
                    textColor: dark ? Colors.white : Colors.black,
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  PSettingsMenuTile(
                    icon: Iconsax.book_saved,
                    title: translatedStrings?[54] ?? "Bookmarked Resources",
                    subTitle: translatedStrings?[63] ?? "Explore your saved educational treasures",
                  ),
                  PSettingsMenuTile(
                      icon: Iconsax.receipt,
                      title: translatedStrings?[55] ?? "My Donations",
                      subTitle: translatedStrings?[59] ?? "Track your contributions"),
                  PSettingsMenuTile(
                      icon: Iconsax.path,
                      title: translatedStrings?[56] ?? "My Blogs",
                      subTitle: translatedStrings?[60] ?? "Your experiences at one place"),
                  PSettingsMenuTile(
                      icon: Iconsax.heart,
                      title: translatedStrings?[57] ?? "Favorite Campaigns",
                      subTitle: translatedStrings?[61] ?? "Stay connected to causes close to your heart"),
                  PSettingsMenuTile(
                      icon: Iconsax.document_favorite,
                      title: translatedStrings?[58] ?? "Saved Blogs",
                      subTitle: translatedStrings?[62] ?? "Your favorite reads"),

                  ///App Settings
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  PSectionHeading(
                    title: translatedStrings?[64] ?? 'App Settings',
                    textColor: dark ? Colors.white : Colors.black,
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  PSettingsMenuTile(
                      icon: Iconsax.language_circle,
                      title: translatedStrings?[65] ?? "Change language",
                      subTitle: translatedStrings?[66] ?? "Tailor your experience with a language switch")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
